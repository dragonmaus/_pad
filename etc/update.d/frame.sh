#!/bin/mksh

set -e

function die {
	typeset -i e=$?
	shift
	log "$@"
	exit $e
}
function log {
	print -r -- ">> $*" >&2
}

dst=/mnt/frame
src=$HOME/Pictures/Wallpapers/1600x1200/digitalblasphemy

umount $dst 2>/dev/null || :
mount $dst || die 111 Could not mount $dst

log Updating $src
redo --no-log "$HOME/etc/wallpaper/1600x1200"

log Cleaning up $dst
ls -rt $dst | while read -r file
do
	name=${file#????-}
	[[ -e $src/$name ]] || rm -fv $dst/$file
done

log Importing from $src
ls -rt $src | nl -nrz -w4 | while IFS="	" read -r num file
do
	file1=$src/$file
	for file2 in $dst/????-$file
	do
		[[ -e $file2 ]] || file2=$dst/$num-$file
		cmp -s $file1 $file2 || {
			cp -fpv $file1 $file2
			fsync $file2
		}
	done
done

log Shuffling $dst
el="s/^/$(tput el)/"
max=$(ls $dst | wc -l)
typeset -i -R${#max} count=0
ls $dst | shuf | nl -nrz -w4 | while IFS="	" read -r num file
do
	name=${file#????-}
	file1=$dst/$file
	file2=$dst/$num-$name
	[[ $file1 = $file2 ]] && continue
	let "count += 1"
	mv -v $file1 $file2 | sed "s/^/($count\\/$max) /;$el;s/\$/\\r/" | tr -d '\n'
	fsync $file2
done
print

umount $dst
