#!/bin/sh

file="$2.c"

redo-ifchange "$file" bin/compile

bin/compile -o "$3" "$file"
