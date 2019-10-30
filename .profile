# ~/.profile

# Ask if X should be started
startx=false
if which startx > /dev/null 2>&1
then
	case "$( tty )" in
	(/dev/tty*)
		printf 'Start X? (y/n): ' 1>&2
		read reply || echo n 1>&2
		case "$reply" in
		([Yy]*) startx=true ;;
		esac
		;;
	esac
fi

cache_home="${XDG_CACHE_HOME:-"$HOME/.cache"}"
config_home="${XDG_CONFIG_HOME:-"$HOME/.config"}"
data_home="${XDG_DATA_HOME:-"$HOME/.local/share"}"

# Clean up and augment PATH
path=
ifs="$IFS"
IFS=:
for d in "$HOME/bin" "$HOME/.cabal/bin" "$HOME/.cargo/bin" "$HOME/.local/bin" "$HOME/src/go/bin" "$HOME/src/go/ext/bin" "$HOME/bin/ext" $PATH "$HOME/bin/mksh"
do
	d="$( realpath "$d" 2> /dev/null || echo "$d" )"
	case ":$path:" in
	(*":$d:"*) continue ;;
	esac
	path="$path:$d"
done
IFS="$ifs"
path="${path#:}"

# Set environment
set -a

# Paths
PATH="$path"
MANPATH="$data_home/man:"

# Shell configuration
ENV="$config_home/shell/init.sh"

# Global configuration
BROWSER=qutebrowser
EDITOR="$( which nvim vim vi 2> /dev/null | head -1 )"
LC_COLLATE=C
PAGER=less; MANPAGER="$PAGER -s"

# X keyboard configuration
XKB_DEFAULT_LAYOUT=us
XKB_DEFAULT_MODEL=pc105
XKB_DEFAULT_OPTIONS=compose:paus
XKB_DEFAULT_VARIANT=dvorak
XKB_INTERNAL_OPTIONS='compose:paus ctrl:nocaps'

# App-specific configuration
DARCS_ALWAYS_COLOR=1
DARCS_DO_COLOR_LINES=1
IDEA_PROPERTIES="$config_home/idea/idea.properties"
LEDGER_FILE="$HOME/Sync/Ledger/ledger.journal"
LESS=FMRi
PASSWORD_STORE_SIGNING_KEY="$( cat "$HOME/.secret/signing.key" )"
PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig"
RIPGREP_CONFIG_PATH="$config_home/ripgrep/config"
SUDO_ASKPASS="$HOME/bin/askpass"
_JAVA_AWT_WM_NONREPARENTING=1

# Go stuff
if which go > /dev/null 2>&1
then
	GOPATH="$HOME/src/go/ext:$HOME/src/go"
	GOROOT="$( go env GOROOT )"
fi

set +a

umask 077

# SSH agent
[[ -r "$data_home/ssh/agent.sh" ]] && . "$data_home/ssh/agent.sh"

# Hand off to X if requested
"$startx" && exec startx
