#!/bin/mksh

print -r -- $DISPLAY >${XDG_DATA_HOME:-$HOME/.local/share}/x.display

[[ -r $HOME/.Xresources ]] && xrdb -I${XDG_CONFIG_HOME:-$HOME/.config}/base16 -load $HOME/.Xresources

setxkbmap -model $XKB_DEFAULT_MODEL -layout $XKB_DEFAULT_LAYOUT -variant $XKB_DEFAULT_VARIANT $(for o in $XKB_DEFAULT_OPTIONS ; do print -r -- -option $o ; done)

XKB_INTERNAL_DEVICE=$(xinput --list --id-only "AT Translated Set 2 keyboard")
[[ -n $XKB_INTERNAL_DEVICE ]] && setxkbmap -device $XKB_INTERNAL_DEVICE $(for o in $XKB_INTERNAL_OPTIONS ; do print -r -- -option $o ; done)

randomise-wallpaper -s

compton &
redshift-hack &
unclutter --ignore-scrolling --jitter 5 &

xset +dpms
xset dpms 300 600 900
xset s off

acpi-handler &

dwmstatus &
exec dwm
