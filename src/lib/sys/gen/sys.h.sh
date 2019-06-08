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
		echo 'format	elf64'
		echo
		echo "section	'.text' executable"
		echo
		echo "	public	$name"
		echo
		echo "$name:"
		echo "	mov	rax, $number		; syscall $name"
		echo '	syscall'
		echo '	ret'
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
