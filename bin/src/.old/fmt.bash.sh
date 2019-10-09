#!/bin/sh

echo() {
	printf '%s\n' "$*"
}

{
	echo function z {
	cat "$@"
	echo
	echo }
	echo typeset -f z
} | bash | unexpand -t 4 | sed '1,2d;$d;s/^	//;s/;$//' | sed '/()[[:blank:]]*$/{N;s/\([[:blank:]]*\)\(function[[:blank:]]\+\)\?\([^[:blank:](]\+\)[[:blank:]]*()[[:blank:][:space:]]*{/\1\3() {/}'
