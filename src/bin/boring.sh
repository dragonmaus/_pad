#!/bin/sh

set -e

repo=$(while :; do [[ -d _darcs ]] && pwd -P && exit; [[ . -ef .. ]] && exit; cd ..; done)
[[ -z $repo ]] && exit 1

file=$repo/_boring
[[ -f $file ]] || touch "$file"

rm -f "$file"{new}

print -lr -- "$@" | cat "$file" - | sort -u >"$file"{new}

fsync "$file"{new}
cmp -s "$file" "$file"{new} || cp -f "$file"{new} "$file"
rm -f "$file"{new}
