#!/bin/sh

tmp=$(mktemp -d)
chmod 700 "$tmp"
trap "rm -fr '$tmp'" EXIT

tag=$(date +TAG%sTAG)

uid=$(id -u)
gid=$(id -g)

# FIXME: two calls to `doas` *per file* is horribly excessive (especially since `persist` is not supported)

set -- "$@" "$tag"
inopts=1
while [[ $1 != $tag ]]
do
	if [[ $1 = -- ]]
	then
		inopts=0
		set -- "$@" "$1"
	elif [[ $inopts -eq 1 && $1 = -* ]]
	then
		set -- "$@" "$1"
	else
		inopts=0
		dir=$tmp/$(dirname "$1" | en%)
		mkdir -p "$dir"
		file=$dir/$(basename "$1")
		doas sh -c 'cp -p "$1" "$2" && chown $3:$4 "$2"' sh "$1" "$file" $uid $gid
		set -- "$@" "$file"
	fi
	shift
done
shift

"${VISUAL:-${EDITOR:-vi}}" "$@" || exit $?

set -- "$@" "$tag"
inopts=1
while [[ $1 != $tag ]]
do
	if [[ $1 = -- ]]
	then
		inopts=0;
	elif [[ $inopts -eq 1 && $1 = -* ]]
	then
		:
	else
		inopts=0
		dir=$(basename "$(dirname "$1")" | un%)
		file=$dir/$(basename "$1")
		doas sh -c 'own=$(stat -c %u:%g "$2") && chown $own "$1" && cp -p "$1" "$2"' sh "$1" "$file"
	fi
	shift
done
