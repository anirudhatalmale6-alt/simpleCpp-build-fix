#!/bin/sh
# selfhost.sh — the three-stage bootstrap.
#
#   stage1 = nano_cc, compiled by the gcc-built nano_cc
#   stage2 = nano_cc, compiled by stage1
#   stage3 = nano_cc, compiled by stage2
#
# and then the test that means something: stage1, stage2 and stage3 must all
# produce BYTE-IDENTICAL output for the same input, and the stage1 and stage2
# binaries must be byte-identical to each other.
#
# Why that is the test. "It compiled itself and the result runs" proves very
# little — a compiler with a real bug can still build something that looks
# like it works, because the bug is present on both sides and cancels. If
# stage1 and stage2 differ, stage1 miscompiled the compiler. If they match,
# the compiler has reached a fixed point: compiling itself again changes
# nothing, so whatever it does, it does consistently to its own source.
#
# simpleC++.c is written against a hosted C library; nano-libc.h supplies that
# on raw Linux syscalls, so nothing here links against glibc.
#
#   sh selfhost.sh

set -u
SRC='simpleC++.c'
W=$(mktemp -d)
trap 'rm -rf "$W"' EXIT
FAIL=0

[ -x ./nano_cc ] || { echo "build nano_cc first (make)"; exit 1; }

# Swap the five system includes for nano-libc.h, placed just before the first
# use of a library type so it is in scope everywhere it is needed.
awk '
  /^#include <(stdio|stdlib|string|ctype|stdarg)\.h>$/ { next }
  /^static FILE \*fout;$/ && !done { print "#include \"nano-libc.h\""; done=1 }
  { print }
' "$SRC" > "$W/selfsrc.c"
cp nano-libc.h nano-base.h "$W/"

# as + ld rather than the cc driver, and every stage assembled from a file with
# the SAME NAME in its own directory. Both tools record the input file name in
# the symbol table, so `as -o s1.o s1.s` and `as -o s2.o s2.s` differ in six
# bytes for a reason that has nothing to do with the compiler. Removing that
# noise is what makes a byte comparison of the binaries meaningful.
build() {           # build <stage-name> <asm>
    mkdir -p "$W/$1.d"
    cp "$2" "$W/$1.d/nano_cc.s"
    ( cd "$W/$1.d" && as --64 -o nano_cc.o nano_cc.s ) 2>"$W/aserr" \
        || { echo "FAIL $1: GNU as rejected the output"; head -5 "$W/aserr"; exit 1; }
    ( cd "$W/$1.d" && ld -o nano_cc nano_cc.o ) 2>"$W/lderr" \
        || { echo "FAIL $1: would not link"; head -5 "$W/lderr"; exit 1; }
    cp "$W/$1.d/nano_cc" "$W/$1"
}

echo "stage 1: the gcc-built compiler compiles its own source"
./nano_cc "$W/selfsrc.c" "$W/s1.s" >/dev/null 2>"$W/err" \
    || { echo "FAIL: nano_cc cannot compile its own source"; cat "$W/err"; exit 1; }
build stage1 "$W/s1.s"
echo "         $(wc -l < "$SRC") lines of C -> $(wc -l < "$W/s1.s") lines of asm -> $(wc -c < "$W/stage1") bytes, no libc"

echo "stage 2: stage1 compiles the same source"
( cd "$W" && ./stage1 selfsrc.c s2.s ) >/dev/null 2>"$W/err" \
    || { echo "FAIL: stage1 could not compile the compiler"; cat "$W/err"; exit 1; }
build stage2 "$W/s2.s"

echo "stage 3: stage2 compiles the same source"
( cd "$W" && ./stage2 selfsrc.c s3.s ) >/dev/null 2>"$W/err" \
    || { echo "FAIL: stage2 could not compile the compiler"; cat "$W/err"; exit 1; }

echo
if cmp -s "$W/s1.s" "$W/s2.s"; then
    echo "PASS stage1 output == stage2 output"
else
    echo "FAIL stage1 and stage2 disagree ($(diff "$W/s1.s" "$W/s2.s" | grep -c '^[<>]') lines)"
    diff "$W/s1.s" "$W/s2.s" | head -10
    FAIL=1
fi
if cmp -s "$W/s2.s" "$W/s3.s"; then
    echo "PASS stage2 output == stage3 output"
else
    echo "FAIL stage2 and stage3 disagree"
    diff "$W/s2.s" "$W/s3.s" | head -10
    FAIL=1
fi
if cmp -s "$W/stage1" "$W/stage2"; then
    echo "PASS stage1 binary == stage2 binary, byte for byte ($(wc -c < "$W/stage1") bytes)"
else
    echo "FAIL the two self-built compilers are different binaries"
    FAIL=1
fi

# A fixed point is necessary but not sufficient: a compiler that emitted
# nothing at all would also be stable. Make stage1 do real work and require it
# to agree with the compiler we trust.
echo
echo "and stage1 has to agree with the gcc-built compiler on every demo:"
HERE=$PWD
cp ./*.c ./*.h "$W/" 2>/dev/null
for d in test features structs bitwise printf switch initializers typedefs \
         gotos functions reserved libcheck sample; do
    [ -f "$HERE/$d.c" ] || continue
    # both compilers run in the same directory on the same file name, so any
    # difference is the code generator and not the path it was handed
    ( cd "$W" && "$HERE/nano_cc" "$d.c" "$d.ref.s" ) >/dev/null 2>&1
    ( cd "$W" && ./stage1        "$d.c" "$d.s1.s"  ) >/dev/null 2>&1
    if [ -s "$W/$d.ref.s" ] && cmp -s "$W/$d.ref.s" "$W/$d.s1.s"; then
        echo "  PASS $d.c: identical assembly"
    else
        echo "  FAIL $d.c: stage1 generated different code"
        diff "$W/$d.ref.s" "$W/$d.s1.s" 2>/dev/null | head -6
        FAIL=1
    fi
done

exit $FAIL
