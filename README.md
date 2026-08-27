# simpleC++ (`nano_cc`)

A tiny, single-file toy compiler that translates a C / small-C++ subset into
x86_64 assembly. The whole compiler lives in **`simpleC++.c`** and builds with a
stock GCC — no third-party libraries.

It now compiles the bundled **`test.c`** all the way through to a running program.

It can even boot **bare metal**: `kernel/` builds a tiny interactive shell —
compiled by `nano_cc` itself — that runs in 64-bit long mode under QEMU and
reads a real PS/2 keyboard. See [`kernel/README.md`](kernel/README.md).

---

## Requirements

A recent GCC with a hosted C library, plus the standard binutils (`as`, `ld`,
which come with GCC). Verified with:

```
gcc (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0
```

On a fresh Debian/Ubuntu machine that is the only package you need:

```sh
sudo apt-get update
sudo apt-get install -y build-essential      # gcc + make + binutils
# optional, only if you want the CMake path:
sudo apt-get install -y cmake
```

---

## Build the compiler

### Option A — Makefile (recommended)

```sh
make                # builds ./nano_cc
```

Exact command it runs:

```sh
gcc -std=c11 -O2 -Wall -Wextra -o nano_cc 'simpleC++.c'
```

### Option B — CMake

```sh
cmake -S . -B build
cmake --build build     # produces ./build/nano_cc
```

Both paths compile **cleanly with zero warnings and zero errors**, even under
`-Wall -Wextra -pedantic`.

---

## Run the compiler on `test.c` (full end-to-end demo)

One command does everything — compile `test.c` with `nano_cc`, assemble + link
the result into a freestanding binary, and run it:

```sh
make test
```

Expected output:

```
./nano_cc test.c test.s
Compiled test.c -> test.s
cc -nostdlib -no-pie test.s -o test_prog
---- ./test_prog output ----
Hello from bare-metal nolibc!
142
3
```

(The `3` is the file descriptor returned by `open("/dev/null", 0)` — it can vary,
but on a normal shell it is 3.)

### Doing it by hand

```sh
./nano_cc test.c test.s                       # nano_cc: C subset  -> x86_64 asm
gcc -nostdlib -no-pie test.s -o test_prog      # GNU as + ld: asm -> freestanding ELF
./test_prog                                    # run it
```

`nano_cc` emits GNU-assembler Intel syntax (`.intel_syntax noprefix`). The
program is freestanding (talks to the kernel via raw `syscall`s from
`nano-nolibc.h`), so it links with `-nostdlib -no-pie` and needs no libc.

There are also two feature demos:

```sh
make demo        # for, do/while, break, continue, prefix ++/--, ternary ?:
make structs     # struct/union, member access . and ->, sizeof, string return
make bitwise     # bitwise & | ^ ~ << >> and function-like #define macros
make printf      # variadic functions -> a real printf() (%d %x %c %s %%)
make switch      # switch / case / default: dispatch, fall-through, nesting
make minimal     # --minimal: compile every demo with the reduced instruction set
```

### `--nasm`: assemble without binutils

`--minimal --nasm` produces the NASM subset a small bootstrap assembler reads —
`section`/`global` rather than `.section`/`.globl`, `db` rather than `.string`
and `.zero`, no `offset` and no `ptr` size keywords. Combined with `--minimal`
the output can be assembled by
[mini-asm](https://github.com/anirudhatalmale6-alt/SelfHostedAssembler-audit)
directly:

```sh
./nano_cc --minimal --nasm printf.c prog.asm
./mini_asm            # reads prog.asm, writes a.out
./a.out
```

No gcc, no binutils. `make bootstrap` in the assembler repo runs all six demos
that way and requires each one to behave exactly as the gcc-assembled build does.

Two things that mode has to handle. String literals are pooled and written after
the last function — the assembler produces one flat segment, so a literal emitted
inline the way GNU-as mode does it would sit in the instruction stream and be
executed. And `dil`, `sil` and `r8b`..`r15b` all need a REX prefix to name at
all, so a `char` parameter goes through `rax` on its way to its stack slot.

### `--minimal`: a reduced instruction set

`nano_cc --minimal` restricts the back end to the instruction set a small
bootstrap assembler can encode:

```
mov  add  or  and  sub  xor  cmp  shl  shr  sar
jmp  je/jz  jne/jnz  jl  jle  jg  jge  jb  jbe  ja  jae
call  ret  syscall
```

plus 64-bit and 8-bit `mov` to and from memory. Everything the back end would
normally reach for is synthesised from those:

| normally | with `--minimal` |
|---|---|
| `push rax` | `sub rsp, 8` / `mov [rsp], rax` |
| `pop rcx` | `mov rcx, [rsp]` / `add rsp, 8` |
| `lea rax, [rbp - N]` | `mov rax, rbp` / `sub rax, N` |
| `lea rax, [rip + sym]` | `mov rax, offset sym` |
| `leave` | `mov rsp, rbp` / `mov rbp, [rsp]` / `add rsp, 8` |
| `test rax, rax` | `cmp rax, 0` |
| `setcc al` + `movzx` | `mov rax, 1` / `jcc` / `mov rax, 0` |
| `movsx rax, byte ptr [rax]` | `mov al, [rax]` / `and rax, 255` / `shl rax, 56` / `sar rax, 56` |
| `neg rax` | `mov rcx, 0` / `sub rcx, rax` / `mov rax, rcx` |
| `not rax` | `xor rax, -1` |
| `imul rax, N` | shift-add over the set bits of N |
| `imul rax, rcx` | shift-add loop over the bits of rcx |
| `cqo` + `idiv rcx` | `call __nano_divmod`, a restoring shift-subtract routine |

The one thing that is **not** synthesised is the 8-bit load and store. A 1-byte
store cannot be built from 8-byte operations without a read-modify-write of the
seven bytes around it, which may not be mapped and is not the same operation.
`char`, strings and `printf` all depend on it, so `mov al, [mem]` and
`mov [mem], al` stay in the required set.

`make minimal` compiles every demo both ways, requires identical output and exit
status, and checks the minimal assembly contains nothing outside the set. The
cost is roughly 50% more instructions:

```
PASS test: same output, only the minimal set, 1128 -> 1702 lines
PASS features: same output, only the minimal set, 1392 -> 2068 lines
PASS structs: same output, only the minimal set, 1333 -> 2002 lines
PASS bitwise: same output, only the minimal set, 1366 -> 2026 lines
PASS printf: same output, only the minimal set, 1141 -> 1722 lines
PASS switch: same output, only the minimal set, 1489 -> 2177 lines
```

You can also compile your own small programs, e.g. the included `sample.c`:

```sh
./nano_cc sample.c sample.s
gcc -nostdlib -no-pie sample.s -o sample_prog
./sample_prog; echo $?      # -> 5
```

---

## What the compiler supports

Enough of C to compile `nano-nolibc.h` + `test.c`:

- **Preprocessor:** `#include "..."`, object-like `#define`, **function-like
  `#define` macros** (e.g. `#define MAX(a,b) ((a)>(b)?(a):(b))` — argument
  substitution with nested-paren handling), `#ifndef` / `#ifdef` / `#else` /
  `#endif` include guards, `//` and `/* */` comments.
- **Types:** `int`, `long`, `char`, `void`, pointers, arrays (of any element
  type), `struct` and `union`, and the `const` / `unsigned` / `static` /
  `inline` / `extern` qualifiers (parsed and ignored). Function prototypes /
  `extern` declarations (`char getc();`) are accepted. *(Note: `int` and `long` are both
  64-bit internally for now — a real 32-bit `int` is a planned next step.)*
- **Expressions:** `+ - * / %`, `< > <= >= == !=`, `&& ||`, **bitwise
  `& | ^ ~ << >>`** (full C precedence), unary `- ! ~ * &`, prefix and postfix
  `++` / `--`, the ternary `?:` operator, `sizeof`, casts, function calls
  (including functions that return pointers/strings), array indexing `a[i]`,
  struct member access `.` and `->`, assignment and compound assignment
  (`+= -= *= /= %=`), string/char literals with escapes.
- **Variadic functions:** `type f(args, ...)` with `__builtin_va_start` /
  `__builtin_va_arg` / `__builtin_va_end` (wrapped as `va_start`/`va_arg`/
  `va_end`), enough to write a real `printf()` — see `printf.c`.
- **Statements:** `if/else`, `while`, `for`, `do/while`, `switch` / `case` /
  `default` (with C fall-through, `break`, and nesting), `break`, `continue`,
  `return`, blocks, and `__asm__("...")` pass-through inline assembly.
- **Initialisers:** brace initialisers for arrays, structs and nested
  combinations of the two (`int t[4] = {1,2,3,4}`, `struct Line l = {{1,2},
  {3,4},99}`, `long m[2][3] = {{1,2,3},{4,5,6}}`), multi-dimensional arrays,
  length inference (`int t[] = {1,2,3}`, `char s[] = "hi"`), string
  initialisers for `char` arrays, arrays of string pointers
  (`char *r[3] = {"a","b","c"}`), and partial initialisers — anything not
  named is zeroed, as C requires. Global initialisers are folded to a byte
  image at compile time; local ones become element-wise stores over a zeroed
  object. See `initializers.c` and `make initializers`.
- **Codegen:** x86_64 System V, values in `rax`, up to 6 register arguments,
  a freestanding `_start` that calls `main` and exits with its return value.

### Not supported yet

`typedef`, `enum`, real (32-bit) `int`, real `unsigned` arithmetic —
`unsigned` currently parses and is **ignored** — function pointers, floating
point, and calls with more than 6 arguments (which now report an error rather
than generating wrong code).

---

## Changes I made to the original repo

The upstream repo **did not compile**, and once it did the bundled `test.c` was
well beyond what the original parser could handle. Summary:

1. **Build fixes** on the original single-pass compiler (mismatched `parse_decl`
   prototype, unused variables, `strncpy` truncation warnings, a broken
   identifier-rewind in `parse_assign`).
2. **Rebuilt the compiler around a small AST** (still one file, `simpleC++.c`) so
   it can actually parse and correctly generate code for the constructs `test.c`
   and `nano-nolibc.h` use — general lvalues (`*p`, `a[i]`), pointer arithmetic,
   postfix `++/--`, `&&`/`||`, casts, `long`, arrays, char/string escapes,
   comma-declarations, and a real (if minimal) preprocessor.
3. **Made the emitted assembly assemble & link** with GNU `as`/`ld`
   (`.intel_syntax noprefix`, `.zero` for `.bss`) and added a freestanding
   `_start`.
4. **One small tweak to `nano-nolibc.h`:** the inline-asm syscall trampoline now
   addresses its globals RIP-relative (`mov rax, [rip + _n]` instead of
   `mov rax, _n`) so the generated code assembles and the syscalls actually fire.
   That is the only change to the header; all the C in it is untouched.

Added build/support files: `Makefile`, `CMakeLists.txt`, `sample.c`.

Verified on GCC 13.3.0: clean build (`-Wall -Wextra -pedantic`, both `-O0` and
`-O2`), and `make test` compiles → assembles → links → runs `test.c` with the
output shown above.
