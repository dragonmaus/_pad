#!/bin/sh

set -e

file=${XDG_DATA_HOME:-$HOME/.local/share}/x.display
[[ -r $file ]] || exit 1

display=$(sed 1q <"$file")

exec env "DISPLAY=$display" "$@"
