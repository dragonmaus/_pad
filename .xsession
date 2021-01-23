#!/bin/sh

# Augment PATH
for p in ~/.local/bin ~/sbin ~/bin
do
	case ":$PATH:" in
	(*:$p:*)
		;;
	(*)
		PATH=$p:$PATH
		export PATH
		;;
	esac
done

. echo.sh

# Set up log file
errfile=~/.xsession-errors
if (umask 077 && cp /dev/null $errfile 2> /dev/null)
then
	exec > $errfile 2>&1
else
	for errfile in ${TMPDIR:-/tmp}/xses-$USER /tmp/xses-$USER
	do
		if ef=$(umask 077 && mktemp $errfile.XXXXXX 2> /dev/null)
		then
			exec > $ef 2>&1
			mv $ef $errfile 2> /dev/null
			break
		fi
	done
fi

# Export important variables
printenv DISPLAY > ~/.xsession-display

# Set up keyboards
options=$(for o in $XKB_DEFAULT_OPTIONS; do echo -option $o; done)
setxkbmap -model $XKB_DEFAULT_MODEL -layout $XKB_DEFAULT_LAYOUT -variant $XKB_DEFAULT_VARIANT $options
XKB_INTERNAL_DEVICE=$(xinput --list --id-only 'AT Translated Set 2 keyboard')
[ -n "$XKB_INTERNAL_DEVICE" ] && setxkbmap -device $XKB_INTERNAL_DEVICE $options

# Set desktop background
backgrounds=$(xdg-user-dir BACKGROUNDS)
if [ -s "$backgrounds/.current-desktop" ]
then
	(
		cd "$backgrounds"
		read -r desk < .current-desktop
		set-desktop "$desk"
	)
else
	randomise-backgrounds -d
fi

# Start background services
picom &
redshift-hack &
xautolock -detectsleep -secure -locker slock -time 10 &
xbanish -i control -i mod4 &

# Reset power management
xset +dpms
xset dpms 300 600 900
xset s off

# Start window manager
dwmstatus &
exec dwm
