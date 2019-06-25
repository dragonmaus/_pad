#!/bin/sh

echo() {
	printf '%s\n' "$*"
}

(
	echo '#include <sys/syscall.h>'
	for name do
		echo "SYS_$name \"$name\""
	done
) | tcc -E - | grep '^[^#_]' | sort -n
