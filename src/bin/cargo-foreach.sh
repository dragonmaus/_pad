#!/bin/sh
set -e

name="$(basename "$0" )"
args=hqv
usage="Usage: $name [-$args] command [args...]"
help="$usage

  -h   display this help
  -q   suppress command error output
  -v   print directories as they are processed"
# cargo passes its arguments unchanged to subcommands
[[ "$1" = foreach ]] && shift
quiet=false
verbose=false
while getopts ":$args" opt
do
	case "$opt" in
	(h)
		print -r -- "$help" >&2
		exit 0
		;;
	(q)
		quiet=true
		;;
	(v)
		verbose=true
		;;
	(:)
		print -r -- "$name: fatal: option '$OPTARG' requires an argument" >&2
		exit 1
		;;
	(\?)
		print -r -- "$name: fatal: unknown option '$OPTARG'" >&2
		exit 1
		;;
	esac
done
shift "$((OPTIND - 1))"
for dir in $(ls -A )
do
	[[ -e "$dir" && -d "$dir" && -e "$dir/Cargo.toml" ]] || continue
	$verbose && print -r ">> $dir"
	if ! ( cd "$dir"; $quiet && exec 2>/dev/null; exec "$@" ) && ! $quiet
	then
		print -r -- "command '$*' failed in directory '$dir'" >&2
	fi
done
