#!/bin/mksh

XDG_CACHE_HOME="${XDG_CACHE_HOME:-"$HOME/.cache"}"
XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-"$HOME/.config"}"
XDG_DATA_HOME="${XDG_DATA_HOME:-"$HOME/.local/share"}"

errfile="$HOME/.xsession-errors"
if ( umask 077 && cp /dev/null "$errfile" 2>/dev/null )
then
	exec > "$errfile" 2>&1
else
	for errfile in "${TMPDIR-/tmp}/xses-$USER" "/tmp/xses-$USER"
	do
		if ef="$( umask 077 && mktemp "$errfile.XXXXXX" 2> /dev/null )"
		then
			exec > "$ef" 2>&1
			mv "$ef" "$errfile" 2> /dev/null
			break
		fi
	done
fi

print -r -- "$DISPLAY" > "$XDG_DATA_HOME/x.display"

[[ -r "$HOME/.Xresources" ]] && xrdb -I"$XDG_CONFIG_HOME/base16" -load "$HOME/.Xresources"

setxkbmap -model "$XKB_DEFAULT_MODEL" -layout "$XKB_DEFAULT_LAYOUT" -variant "$XKB_DEFAULT_VARIANT" $( for o in $XKB_DEFAULT_OPTIONS ; do print -r -- -option "$o" ; done )

XKB_INTERNAL_DEVICE="$( xinput --list --id-only 'AT Translated Set 2 keyboard' )"
[[ -n $XKB_INTERNAL_DEVICE ]] && setxkbmap -device "$XKB_INTERNAL_DEVICE" $( for o in $XKB_INTERNAL_OPTIONS ; do print -r -- -option "$o" ; done )

randomise-wallpaper -s

compton &
redshift-hack &
unclutter --ignore-scrolling --jitter 5 &
xautolock -detectsleep -secure -locker slock -time 10 &

xset +dpms
xset dpms 300 600 900
xset s off

acpi-handler &

dwmstatus &
exec dwm
