#!/bin/sh

for p in ~/.local/bin ~/bin
do
    case :$PATH: in
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

# Set up environment exports
printenv DISPLAY > ~/tmp/x.env.display

# Set up keyboard configurations
setxkbmap -model $XKB_DEFAULT_MODEL -layout $XKB_DEFAULT_LAYOUT -variant $XKB_DEFAULT_VARIANT $(for o in $XKB_DEFAULT_OPTIONS; do echo -option $o; done)
XKB_INTERNAL_DEVICE=$(xinput --list --id-only 'AT Translated Set 2 keyboard')
[[ -n $XKB_INTERNAL_DEVICE ]] && setxkbmap -device $XKB_INTERNAL_DEVICE $(for o in $XKB_INTERNAL_OPTIONS; do echo -option $o; done)

# Set desktop background
backgrounds=$(xdg-user-dir BACKGROUNDS)
if [[ -f $backgrounds/.current-desktop ]]
then
    set-desktop $backgrounds/.current-desktop
else
    randomise-backgrounds -d
fi

# Start X services
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
