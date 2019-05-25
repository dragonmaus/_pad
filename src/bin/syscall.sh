#!/bin/sh
(
  print "#include <sys/syscall.h>"
  for name do
    print "__NR_$name \"$name\""
  done
) | tcc -E - | grep "^[^#_]" | sort -n
