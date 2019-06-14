#!/bin/sh

echo() { printf '%s\n' "$*"; }

echo '#ifndef SYS_H'
echo '#define SYS_H'
echo

if [[ -r sys.h.pre ]]
then
	cat sys.h.pre
fi

while read -r number name prototype
do
	echo "$prototype"
	if [[ $number = - ]]
	then
		continue
	fi
	{
		echo "%include 'core.m'"
		echo
		echo '	section	.text'
		echo "proc $name"
		echo "	sinvoke	$number	; syscall $name"
		echo 'endproc'
	} >$name.s.new
	cmp -s $name.s.new $name.s || mv -f $name.s.new $name.s
	rm -f $name.s.new
done <sys.h.list

if [[ -r sys.h.post ]]
then
	cat sys.h.post
fi

echo
echo '#endif'
