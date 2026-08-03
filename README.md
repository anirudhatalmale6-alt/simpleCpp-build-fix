# simpleC++ (`nano_cc`)

A tiny, single-file toy compiler that translates a C / small-C++ subset into
x86_64 assembly. The whole compiler lives in **`simpleC++.c`** and builds with a
stock GCC — no third-party libraries.

---

## Build (quick start)

### Requirements
- A recent GCC with a hosted C library. Verified with:

  ```
  gcc (Ubuntu 13.3.0-6ubuntu2~24.04.1) 13.3.0
  ```

- On a fresh Debian/Ubuntu machine, that is the only package you need:

  ```sh
  sudo apt-get update
  sudo apt-get install -y build-essential      # gcc + make
  # optional, only if you want the CMake path:
  sudo apt-get install -y cmake
  ```

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

## Run it

`nano_cc` takes a C source file and writes an x86_64 assembly file:

```sh
./nano_cc <input.c> <output.s>
```

A ready-made sample is included:

```sh
make run                 # compiles sample.c -> sample.s and prints the result
# or manually:
./nano_cc sample.c sample.s
```

Expected console output:

```
Compiled sample.c -> sample.s
```

`sample.s` will contain the generated assembly for `add()` / `main()`.

---

## What I changed (minimal source tweaks)

The upstream source did **not** compile. The changes were kept as small as possible:

1. **Fixed a conflicting declaration.** `parse_decl` was forward-declared as
   `Type* parse_decl();` but defined as `void parse_decl()`. GCC rejects this as
   a hard error. The prototype now matches the definition (`void`).
2. **Removed unused variables** (`val`, `arg_idx`, `p`, `idx`, `param_count`)
   that tripped `-Wall -Wextra`.
3. **Silenced `-Wstringop-truncation`** (which fires at `-O2`) by replacing the
   two `strncpy(dst, name, 63)` calls into fixed 64-byte buffers with the
   guaranteed-terminated `snprintf(dst, sizeof(dst), "%s", name)`.
4. **Fixed a parser bug** in `parse_assign`: the "not an assignment" rewind path
   re-read the identifier from the wrong offset and produced an empty name,
   which caused blank `call` / `lea [rip + ]` in the output. It now restores the
   identifier correctly, so calls and variable references resolve.

Added build/support files: `Makefile`, `CMakeLists.txt`, `sample.c`.

---

## Note on the generated assembly (out of scope)

The build task above is complete: the compiler compiles cleanly and runs. Worth
being upfront, though — the assembly `nano_cc` *emits* uses Intel-syntax mnemonics
plus a couple of NASM-style directives (e.g. `resb`), so it is not a drop-in for
GNU `as` without a `.intel_syntax noprefix` prologue and directive tweaks, and the
toy code generator still has rough edges (e.g. a simplistic local-vs-global rule).
Fixing the code generator so the output assembles and links end-to-end is a
larger, separate piece of work — happy to take that on if you'd like, just let me
know.
