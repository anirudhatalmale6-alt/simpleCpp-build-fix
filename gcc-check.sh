#!/bin/sh
# gcc-check.sh — run one test program through every nano_cc mode and require
# each one to print exactly what gcc prints for the SAME source.
#
# The reference is gcc compiling that source with <stdio.h> swapped in for
# nano-nolibc.h, so every printed value is an independent second opinion
# rather than a number I decided was right.
#
#   normal   nano_cc                  -> GNU as
#   minimal  nano_cc --minimal        -> GNU as     (bootstrap instruction set)
#   nasm     nano_cc --minimal --nasm -> mini-asm, if one is available
#
#   sh gcc-check.sh <source.c> [path-to-mini-asm]

set -u
SRC=${1:?usage: gcc-check.sh <source.c> [path-to-mini-asm]}
MINIASM=${2:-}
W=$(mktemp -d)
trap 'rm -rf "$W"' EXIT
FAIL=0

[ -x ./nano_cc ] || { echo "build nano_cc first (make)"; exit 1; }

# --- reference -------------------------------------------------------------
sed -e 's|#include "nano-nolibc.h"|#include <stdio.h>|' \
    -e 's|#include "nano-libc.h"|#include <stdio.h>\n#include <stdlib.h>\n#include <string.h>\n#include <ctype.h>|' \
    "$SRC" > "$W/ref.c"
cc -w -o "$W/ref" "$W/ref.c" || { echo "FAIL: gcc could not build the reference"; exit 1; }
"$W/ref" > "$W/ref.txt" 2>&1

check() {            # check <name> <extra nano_cc flags>
    name=$1; shift
    ./nano_cc "$@" "$SRC" "$W/$name.s" >/dev/null 2>&1 \
        || { echo "FAIL $name: nano_cc rejected the source"; FAIL=1; return; }
    cc -nostdlib -no-pie "$W/$name.s" -o "$W/$name" 2>/dev/null \
        || { echo "FAIL $name: would not assemble"; FAIL=1; return; }
    "$W/$name" > "$W/$name.txt" 2>&1
    if diff -q "$W/ref.txt" "$W/$name.txt" >/dev/null; then
        echo "PASS $name: identical to gcc ($(wc -l < "$W/ref.txt") lines checked)"
    else
        echo "FAIL $name: differs from gcc"
        diff "$W/ref.txt" "$W/$name.txt" | head -20
        FAIL=1
    fi
}

check normal
check minimal --minimal

# --- through the bootstrap assembler, if we were given one -----------------
if [ -n "$MINIASM" ] && [ -x "$MINIASM" ]; then
    cp "$MINIASM" "$W/mini_asm"
    ./nano_cc --minimal --nasm "$SRC" "$W/selfHosted.asm" >/dev/null 2>&1 \
        || { echo "FAIL nasm: nano_cc rejected the source"; FAIL=1; }
    ( cd "$W" && rm -f a.out && timeout 60 ./mini_asm ) 2>"$W/err"
    if [ $? -ne 0 ]; then
        echo "FAIL nasm: mini-asm rejected the output: $(cat "$W/err")"
        FAIL=1
    else
        chmod +x "$W/a.out"
        ( cd "$W" && ./a.out ) > "$W/nasm.txt" 2>&1
        if diff -q "$W/ref.txt" "$W/nasm.txt" >/dev/null; then
            echo "PASS nasm: identical to gcc, assembled with no binutils ($(wc -c < "$W/a.out") bytes)"
        else
            echo "FAIL nasm: differs from gcc"
            diff "$W/ref.txt" "$W/nasm.txt" | head -20
            FAIL=1
        fi
    fi
else
    echo "SKIP nasm: pass the path to a built mini-asm to include this leg"
fi

exit $FAIL
