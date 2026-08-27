# simpleC++ (`nano_cc`)

A tiny, single-file toy compiler that translates a C / small-C++ subset into
x86_64 assembly. The whole compiler lives in **`simpleC++.c`** and builds with a
stock GCC — no third-party libraries.

It now compiles the bundled **`test.c`** all the way through to a running program.

It also now compiles **its own source**: `make selfhost` runs `nano_cc` over
`simpleC++.c` and GNU `as` accepts the 30k lines of assembly that come out.
What is still missing is a freestanding C library to link it against — see
[Self-hosting: where it stands](#self-hosting-where-it-stands).

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
make initializers # brace initialisers, every value checked against gcc
make typedefs    # typedef + enum
make gotos       # goto and labels
make functions   # array parameters and function return types
make reserved    # C names that are assembler keywords (sp, ax, flat, ...)
make checkall    # all five of the above in one go
make selfhost    # how far is nano_cc from compiling itself?
```

The five checked suites do not print a demo — they compile the
same source with gcc (swapping `<stdio.h>` in for `nano-nolibc.h`) and require
`nano_cc`'s output to match it line for line, in normal mode and in `--minimal`.
Add `MINIASM=../sha-audit/build/fixed` to include a third leg that assembles
with no binutils at all:

```
PASS normal: identical to gcc (46 lines checked)
PASS minimal: identical to gcc (46 lines checked)
PASS nasm: identical to gcc, assembled with no binutils (14557 bytes)
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
PASS test: same output, only the minimal set, 1128 -> 1703 lines
PASS features: same output, only the minimal set, 1392 -> 2069 lines
PASS structs: same output, only the minimal set, 1333 -> 2003 lines
PASS bitwise: same output, only the minimal set, 1366 -> 2027 lines
PASS printf: same output, only the minimal set, 1141 -> 1723 lines
PASS switch: same output, only the minimal set, 1489 -> 2178 lines
```

You can also compile your own small programs, e.g. the included `sample.c`:

```sh
./nano_cc sample.c sample.s
gcc -nostdlib -no-pie sample.s -o sample_prog
./sample_prog; echo $?      # -> 5
```

---

## Self-hosting: where it stands

`make selfhost` answers the question by measuring rather than guessing:

```
PASS compile: nano_cc compiled all 2402 lines of its own source
              -> 30176 lines of assembly
PASS assemble: GNU as accepted it (125816 bytes of object)

REMAINING: 24 C library functions have no freestanding implementation.
These are the whole gap between here and a real stage-1 bootstrap:
  calloc exit fclose fgetc fopen fprintf fputc fputs free isalnum
  isalpha isdigit isspace isxdigit malloc memcpy memmove perror
  printf snprintf strcmp strlen tolower vfprintf
```

So the **compiler** side is done: every construct in `simpleC++.c` now parses
and generates code, and GNU `as` accepts the result. What is left is a
**library** question — `simpleC++.c` is written against a hosted C library,
and a freestanding one does not exist yet. `nano-nolibc.h` already covers
`write`/`open`/`close`/`exit`/`printf`/`strlen`/`strcmp`/`memcpy` on raw
syscalls; the 24 above are the rest.

To keep those two questions apart, `make selfhost` swaps the five system
includes for [`selfhost-shim.h`](selfhost-shim.h), which contains
**declarations only, no code**. A clean compile therefore means "the compiler
handles all of its own source" and specifically **not** "it links and runs" —
the undefined-symbol list is the honest remainder. Getting from here to a real
bootstrap means writing that library, then requiring stage 1 and stage 2 to
come out byte-identical.

Five constructs had to be added along the way, each of which the compiler used
in its own source: `typedef`, `enum`, `goto`, array parameters, and declared
function return types. The last one is why `cur()->text` used to fail — every
call was typed `long`, so a member lookup on a call result had nothing to look
in.

---

## What the compiler supports

Enough of C to compile `nano-nolibc.h` + `test.c`:

- **Preprocessor:** `#include "..."`, object-like `#define`, **function-like
  `#define` macros** (e.g. `#define MAX(a,b) ((a)>(b)?(a):(b))` — argument
  substitution with nested-paren handling), `#ifndef` / `#ifdef` / `#else` /
  `#endif` include guards, `//` and `/* */` comments.
- **Types:** `int`, `long`, `char`, `void`, pointers, arrays (of any element
  type), `struct` and `union`, **`typedef`** and **`enum`**, and the `const` /
  `unsigned` / `static` / `inline` / `extern` qualifiers (parsed and ignored).
  Function prototypes /
  `extern` declarations (`char getc();`) are accepted. *(Note: `int` and `long` are both
  64-bit internally for now — a real 32-bit `int` is a planned next step.)*
- **`typedef`:** names for builtins, pointers, arrays and structs
  (`typedef char *string;`, `typedef char line[8];`,
  `typedef struct Pt { long x, y; } Pt;`), typedefs of typedefs, anonymous
  struct typedefs (`typedef struct { ... } Pair;`), and the self-referential
  idiom `typedef struct Node Node; struct Node { long v; Node *next; };` —
  the name is registered while the struct is still incomplete and the later
  definition fills in that same type, so no second pass is needed. Typedef
  names work everywhere a type does, including casts, `sizeof` and parameter
  lists, and may be declared at block scope.
- **`enum`:** tagged and untagged, implicit auto-increment from 0, explicit
  values that the auto-increment then resumes from (`{A=5, B, C=1<<4, D}` is
  5, 6, 16, 17), negative values, and a trailing comma. Enumerators are
  compile-time constants, so they can be used as array lengths
  (`long t[NSLOT]`), in constant expressions (`long t[NSLOT * 2]`), in global
  initialisers, and as `case` labels. `enum Tag` is accepted as a type name.
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
  `return`, **`goto` and labels** (forward, backward, out of nested loops, and
  inside a `switch`; label names are per function, so two functions may each
  have a `done:`), blocks, and `__asm__("...")` pass-through inline assembly.
- **Functions:** up to 6 register arguments, variadic functions, prototypes,
  **array parameters** — `long m[4][3]` is `long (*m)[3]`, only the outermost
  dimension decays — and **declared return types**, so `pick_name(0)[1]`,
  `item_at(1)->id` and `*slot_of(a,3) = 99` all mean what C says they mean. A
  prototype is enough: definitions and `extern` declarations both register.
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

Real (32-bit) `int`, real `unsigned` arithmetic — `unsigned` currently parses
and is **ignored** — function pointers, floating point, calls with more than
6 arguments, and passing or returning a `struct` **by value**. The last three
now report an error rather than generating wrong code: a struct used as a
value decays to its address here, so `f(s)` would have handed the callee a
pointer and let it read that pointer as the first field.

Two deliberate size differences from a hosted gcc, worth knowing before you
compare `sizeof`: `int` is 8 bytes here, not 4, and so is an `enum`.

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

5. **Renamed C identifiers that are assembler keywords** on the way out. A
   global called `sp`, `ax`, `ch` or `gs`, or a function called `flat`, parses
   as a register or a keyword in Intel syntax, so the compiler used to emit a
   file that looked correct and would not assemble
   (``Error: `[rip+sp]' is not a valid base/index expression``). The new name
   contains a dot, which no C identifier can, so it cannot collide with a real
   symbol. See `reserved.c`.

Added build/support files: `Makefile`, `CMakeLists.txt`, `sample.c`.

Verified on GCC 13.3.0: clean build (`-Wall -Wextra -pedantic`, both `-O0` and
`-O2`), and `make test` compiles → assembles → links → runs `test.c` with the
output shown above.
