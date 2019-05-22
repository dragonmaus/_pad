#!/bin/sh

echo() { printf '%s\n' "$*"; }

echo '/* automatically generated */'
echo '#define RC_INVOKED /* we only want the E macros */'
echo '#include <errno.h>'
echo '#undef RC_INVOKED'
echo '#include "error.h"'
echo
echo 'int errno;'
let "i = 0"
while read -r name errno temp str
do
  [[ $name = - ]] && continue
  let "--i"
  echo
  echo "int $name ="
  echo "#ifdef $errno"
  echo "$errno;"
  echo "#else"
  echo "$i;"
  echo "#endif"
done <error.list
