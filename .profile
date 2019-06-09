startx=false
if which startx >/dev/null 2>&1
then
	case $(tty) in
	(/dev/tty*)
		printf "Start X? (y/n): " >&2
		read reply || echo n >&2
		case $reply in
		([Yy]*)
			startx=true
			;;
		esac
		;;
	esac
fi

XDG_CACHE_HOME=${XDG_CACHE_HOME:-$HOME/.cache}
XDG_CONFIG_HOME=${XDG_CONFIG_HOME:-$HOME/.config}
XDG_DATA_HOME=${XDG_DATA_HOME:=$HOME/.local/share}

path=
ifs=$IFS
IFS=:
for d in $HOME/bin $HOME/.cabal/bin $HOME/.cargo/bin $HOME/.local/bin $HOME/src/go/bin $HOME/src/go/ext/bin $HOME/bin/ext $PATH $HOME/bin/mksh
do
	d=$(realpath $d 2>/dev/null || echo $d)
	case :$path: in
	(*:$d:*)
		continue
		;;
	esac
	path=$path:$d
done
IFS=$ifs
path=${path#:}

set -a

PATH=$path
ENV=$XDG_CONFIG_HOME/shell/init.sh

# prepend local man directory to MANPATH
MANPATH=$XDG_DATA_HOME/man:

HOSTNAME=${HOSTNAME:-$(hostname)}
test -r $XDG_CONFIG_HOME/locale.conf && . $XDG_CONFIG_HOME/locale.conf

EDITOR=$( which nvim vim vi 2>/dev/null | ( read line ; echo $line ) )

XKB_DEFAULT_LAYOUT=us
XKB_DEFAULT_MODEL=pc105
XKB_DEFAULT_OPTIONS=compose:paus
XKB_DEFAULT_VARIANT=dvorak
XKB_INTERNAL_OPTIONS="compose:paus ctrl:nocaps"

BASE16_SHELL_SET_BACKGROUND=false
DARCS_ALWAYS_COLOR=1
DARCS_DO_COLOR_LINES=1
IDEA_PROPERTIES=$XDG_CONFIG_HOME/idea/idea.properties
LESSHISTFILE=/dev/null
PASSWORD_STORE_SIGNING_KEY=$(cat $HOME/.secret/signing.key)
PKG_CONFIG_PATH=$HOME/.local/lib/pkgconfig
RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgrep/rgrc
SUDO_ASKPASS=$HOME/bin/askpass
_JAVA_AWT_WM_NONREPARENTING=1

if which go >/dev/null 2>&1
then
	GOPATH=$HOME/src/go/ext:$HOME/src/go
	GOROOT=$(go env GOROOT)
fi

set +a

test -r $XDG_DATA_HOME/ssh/agent.sh && . $XDG_DATA_HOME/ssh/agent.sh

$startx && exec startx
