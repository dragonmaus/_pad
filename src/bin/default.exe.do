#!/bin/sh

exists() {
	[[ -e "$1" && -f "$1" && -s "$1" ]]
	return $?
}

check() {
	if exists "$2.c"
	then
		file="$2.o"
		kind=c
		return 0
	fi
	for ext in sh py sed calc
	do
		if exists "$2.$ext"
		then
			file="$2.$ext"
			kind=script
			return 0
		fi
	done
	echo "$0: Fatal: don't know how to build '$1'" 1>&2
	exit 99
}

check "$@"

case "$kind" in
(c)
	redo-ifchange "$file" bin/load bin/strip $( [[ -e "$file.args" ]] && echo "$file.args" )

	bin/load -o "$3" "$file" $( [[ -e "$file.args" ]] && cat "$file.args" )
	bin/strip "$3"
	;;
(script)
	redo-ifchange "$file"

	cat < "$file" > "$3"
	chmod +x "$3"
	;;
esac
