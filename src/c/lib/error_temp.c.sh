#!/bin/sh

echo() { printf '%s\n' "$*"; }

echo '/* automatically generated */'
echo '#define RC_INVOKED /* we only want the E macros */'
echo '#include <errno.h>'
echo '#undef RC_INVOKED'
echo '#include "error.h"'
echo
echo '#define X(n) if (e == n) return 1'
echo
echo '  unsigned int'
echo 'error_temp(int e)'
echo '{'
while read -r name errno temp str
do
  [[ $temp = soft ]] || continue
  if [[ $name = - ]]
  then
    echo "#ifdef $errno"
    echo "  X($errno);"
    echo "#endif"
  else
    echo "  X($name);"
  fi
done <error.list
echo '  return 0;'
echo '}'
