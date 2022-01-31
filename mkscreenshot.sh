#!/bin/bash
OUT=${1:-${HOME}/Pictures/out$(date +"%m-%d_%H-%M-%S").png}

# check if $1 contains fiel extantion
if ! [[ "$OUT" =~ .*\.[^/].* ]]; then
	OUT=$OUT.png
fi
# check if absolute path is given, and convert it to, if not
if ! [[ "$OUT" =~ .*/.* ]]; then
	OUT=$(pwd)/${OUT}
fi
echo $OUT

slop=$(slop -f "%g") || exit 1
read -r G < <(echo $slop)
import -window root -crop $G $OUT
