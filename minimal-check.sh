#!/bin/sh
# C-min verification.
#
# For every demo: compile it normally and with --minimal, run both, and require
# identical output and exit status. Then check that the minimal assembly uses
# only the instruction set the bootstrap assembler implements.
#
#   sh minimal-check.sh

set -u
CC=${CC:-cc}
T=$(mktemp -d)
trap 'rm -rf "$T"' EXIT
FAIL=0

ALLOWED="mov add or and sub xor cmp shl shr sar jmp je jz jne jnz jl jle jg jge jb jbe ja jae call ret syscall"

for d in test features structs bitwise printf switch; do
    ./nano_cc "$d.c" "$T/$d.s" >/dev/null || { echo "FAIL $d: normal compile"; FAIL=1; continue; }
    $CC -nostdlib -no-pie "$T/$d.s" -o "$T/${d}_n" || { echo "FAIL $d: normal link"; FAIL=1; continue; }
    A=$("$T/${d}_n" 2>&1; echo "rc=$?")

    ./nano_cc --minimal "$d.c" "$T/${d}_m.s" >/dev/null || { echo "FAIL $d: minimal compile"; FAIL=1; continue; }
    $CC -nostdlib -no-pie "$T/${d}_m.s" -o "$T/${d}_b" || { echo "FAIL $d: minimal link"; FAIL=1; continue; }
    B=$("$T/${d}_b" 2>&1; echo "rc=$?")

    if [ "$A" != "$B" ]; then
        echo "FAIL $d: --minimal changed the program's behaviour"
        diff "$T/a" "$T/b" 2>/dev/null
        printf '%s\n' "--- normal ---" "$A" "--- minimal ---" "$B"
        FAIL=1
        continue
    fi

    bad=$(grep -oE '^[[:space:]]+[a-z][a-z0-9]*' "$T/${d}_m.s" | tr -d ' \t' | sort -u | while read -r m; do
        case " $ALLOWED " in *" $m "*) ;; *) echo "$m" ;; esac
    done | tr '\n' ' ')
    if [ -n "$bad" ]; then
        echo "FAIL $d: minimal output uses instructions outside the set: $bad"
        FAIL=1
        continue
    fi

    na=$(wc -l < "$T/$d.s"); nb=$(wc -l < "$T/${d}_m.s")
    echo "PASS $d: same output, only the minimal set, ${na} -> ${nb} lines"
done

exit $FAIL
