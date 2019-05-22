#!/bin/sh

echo() { printf '%s\n' "$*"; }

echo '/* automatically generated */'
echo '#define RC_INVOKED /* we only want the E macros */'
echo '#include <errno.h>'
echo '#undef RC_INVOKED'
echo '#include "error.h"'
echo
echo '#define X(n,s) if (e == n) return s'
echo
echo '  const char *'
echo 'error_str(int e)'
echo '{'
echo '  X(0, "no error");'
while read -r name errno temp str
do
  if [[ $name = - ]]
  then
    echo "#ifdef $errno"
    echo "  X($errno, \"$str\");"
    echo "#endif"
  else
    echo "  X($name, \"$str\");"
  fi
done <error.list
echo "  return \"unknown error\";"
echo "}"
