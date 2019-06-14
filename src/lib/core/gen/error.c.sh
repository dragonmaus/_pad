#!/bin/sh

echo() { printf '%s\n' "$*"; }

echo '/* automatically generated */'
echo '#include <errno.h>'
echo '#include "error.h"'
echo
echo '#undef errno'
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
