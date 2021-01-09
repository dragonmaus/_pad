# ~/.profile

# User-specific shell profile

# Ensure that `echo' is sane
case "$KSH_VERSION" in
(*'MIRBSD KSH'*|*'LEGACY KSH'*|*'PD KSH'*)
    echo() {
        print -R "$@"
    }
    ;;
(*)
    echo() {
        case "$1" in
        (-n)
            shift
            printf '%s' "$*"
            ;;
        (*)
            printf '%s\n' "$*"
            ;;
        esac
    }
    ;;
esac

# Enforce `separation of concerns' between login and interactive shells
shell=$(basename "$SHELL")
shell=${shell:-sh}
case $- in
(*i*)
    exec $shell -l -c 'exec $shell -i "$@"' $shell "$@"
    ;;
esac

# Ask if X should be started
startx=
if which startx > /dev/null 2>&1
then
    case $(tty) in
    (/dev/tty*)
        echo -n 'Start X? (y/n): ' 1>&2
        read reply || echo n 1>&2
        case "$reply" in
        ([Yy]*)
            startx='exec startx'
            ;;
        esac
        ;;
    esac
fi

# Pull in Nix configuration
nix=~/.nix-profile/etc/profile.d/nix.sh
[[ -e $nix ]] && . $nix

# XDG directories
CONF=${XDG_CONFIG_HOME:-~/.config}
DATA=${XDG_DATA_HOME:-~/.local/share}

# Clean up and augment PATH
path=
ifs=$IFS
IFS=:
for d in ~/bin ~/.cargo/bin ~/.local/bin ~/.local/games ~/bin/ext $PATH
do
    case /$d/ in
    (*/.nix-profile/*|*/nix/*)
        ;;
    (*)
        d=$(realpath $d 2> /dev/null || echo $d)
        ;;
    esac
    case ":$path:" in
    (*:$d:*)
        continue
        ;;
    esac
    path=$path:$d
done
IFS=$ifs
path=${path#:}

# Set environment
set -a

## Paths
MANPATH=$DATA/man:
PATH=$path

## Shell configuration
ENV=$CONF/shell/init.sh

## Global configuration
EDITOR=$(which nvim vim vi 2> /dev/null | head -1)
HOSTNAME=${HOSTNAME:-$(hostname -s)}
PAGER=less; MANPAGER="$PAGER -s"

## X keyboard configuration
XKB_DEFAULT_LAYOUT=us
XKB_DEFAULT_MODEL=pc105
XKB_DEFAULT_OPTIONS=compose:paus
XKB_DEFAULT_VARIANT=dvorak
XKB_INTERNAL_OPTIONS='compose:paus ctrl:nocaps'

## App-specific configuration
LESS=FMRXi
LESSHISTFILE=-
PASSWORD_STORE_DIR=~/.password-store
PASSWORD_STORE_KEY=$(cat ~/etc/secret/encryption.key)
PASSWORD_STORE_SIGNING_KEY=$(cat ~/etc/secret/signing.key)
RIPGREP_CONFIG_PATH=$CONF/ripgrep/config

set +a

# SSH agent
[[ -f ~/.ssh/agent.sh ]] && . ~/.ssh/agent.sh

# Update SSH environment
f=~/.ssh/environment
rm -f $f{new}
grep -v '^PATH=' < $f > $f{new}
echo "PATH=$PATH" >> $f{new}
mv -f $f{new} $f

# Hand off to X if requested
$startx
