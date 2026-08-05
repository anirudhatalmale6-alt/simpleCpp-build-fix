# simpleC++ (`nano_cc`)

A tiny, single-file toy compiler that translates a C / small-C++ subset into
x86_64 assembly. The whole compiler lives in **`simpleC++.c`** and builds with a
stock GCC — no third-party libraries.

It now compiles the bundled **`test.c`** all the way through to a running program.

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

There is also a control-flow / operator feature demo (`for`, `do/while`,
`break`, `continue`, prefix `++/--`, ternary `?:`):

```sh
make demo
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

- **Preprocessor:** `#include "..."`, object-like `#define`, `#ifndef` /
  `#ifdef` / `#else` / `#endif` include guards, `//` and `/* */` comments.
- **Types:** `int`, `long`, `char`, `void`, pointers, `char` arrays, and the
  `const` / `unsigned` / `static` / `inline` qualifiers (parsed and ignored).
- **Expressions:** `+ - * / %`, `< > <= >= == !=`, `&& ||`, unary `- ! * &`,
  prefix and postfix `++` / `--`, the ternary `?:` operator, casts, function
  calls, array indexing `a[i]`, assignment and compound assignment
  (`+= -= *= /= %=`), string/char literals with escapes.
- **Statements:** `if/else`, `while`, `for`, `do/while`, `break`, `continue`,
  `return`, blocks, and `__asm__("...")` pass-through inline assembly.
- **Codegen:** x86_64 System V, values in `rax`, up to 6 register arguments,
  a freestanding `_start` that calls `main` and exits with its return value.

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
