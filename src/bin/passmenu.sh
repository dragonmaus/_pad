#!/bin/sh

set -e

echo() {
	print -r -- "$*"
}

warn() {
	echo "$*" 1>&2
}

die() {
	e="$1"
	shift
	warn "$*"
	exit "$e"
}

name="$( basename "$0" .sh )"
usage="Usage: $name [-Uhtu] [-- [dmenu args]]"
help="$usage

  -c   copy the output instead of printing it
  -t   type the output instead of printing it

  -U   output the URI field (if any)
  -u   output the user field (if any)

  -h   display this help"

filter=1p
mode=show
while getopts :Uhtu opt
do
	case $opt in
	(U)
		filter='s/^uri://p'
		;;
	(c)
		mode=copy
		;;
	(h)
		die 0 "$help"
		;;
	(t)
		mode=type
		;;
	(u)
		filter='s/^user://p'
		;;
	(:)
		warn "$name: Option '$OPTARG' requires an argument"
		die 100 "$usage"
		;;
	(\?)
		warn "$name: Unknown option '$OPTARG'"
		die 100 "$usage"
		;;
	esac
done
shift $(( OPTIND - 1 ))

prefix="${PASSWORD_STORE_DIR:-"$HOME/.password-store"}"
key="$( ( cd "$prefix" && find . -not \( -name '.[!.]*' -prune \) -type f ) | sed -En 's:^\./(.+)\.gpg$:\1:p' | pathsort -u | dmenu "$@" )"
[[ -n "$key" ]] || exit 1

selection="${PASSWORD_STORE_X_SELECTION:-clipboard}"

case "$mode" in
(copy)
	pass show "$key" | sed -n "$filter" | xclip -i -selection "$selection"
	;;
(show)
	pass show "$key" | sed -n "$filter"
	;;
(type)
	pass show "$key" | sed -n "$filter" | ( IFS= read -r pass && echo "$pass" ) | xdotool type --clearmodifiers --file -
	;;
esac
