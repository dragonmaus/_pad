# ~/.profile

# User-specific shell profile

# Ensure that `echo' is sane
case "$KSH_VERSION" in
(*MIRBSD\ KSH*|*LEGACY\ KSH*|*PD\ KSH*)
  echo() {
    print -R "$@"
  }
  ;;
(*)
  echo() {
    if [[ "$1" = -n ]]
    then
      shift
      printf '%s' "$*"
    else
      printf '%s\n' "$*"
    fi
  }
  ;;
esac

# Ask if X should be started
startx=
if which startx > /dev/null 2>&1
then
  case "$( tty )" in
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

# XDG directories
CONF="${XDG_CONFIG_HOME:-"$HOME/.config"}"
DATA="${XDG_DATA_HOME:-"$HOME/.local/share"}"

# Clean up and augment PATH
path=
ifs="$IFS"
IFS=:
for d in "$HOME/bin" "$HOME/.cargo/bin" "$HOME/.cabal/bin" "$HOME/src/go/bin" "$HOME/src/go/ext/bin" "$HOME/.local/bin" "$HOME/bin/ext" $PATH "$HOME/bin/wine" "$HOME/bin/mksh"
do
  d="$( readlink -f "$d" 2> /dev/null || echo "$d" )"
  case ":$path:" in
  (*":$d:"*)
    continue
    ;;
  esac
  path="$path:$d"
done
IFS="$ifs"
path="${path#:}"

# Set environment
set -a

## Paths
GOPATH="$HOME/src/go/ext:$HOME/src/go"
MANPATH="$DATA/man:"
PATH="$path"

## Shell configuration
ENV="$CONF/shell/init.sh"

## Global configuration
BROWSER=qutebrowser
EDITOR="$( which nvim vim vi 2> /dev/null | head -1 )"
LC_COLLATE=C
PAGER=less; MANPAGER="$PAGER -s"

## X keyboard configuration
XKB_DEFAULT_LAYOUT=us
XKB_DEFAULT_MODEL=pc105
XKB_DEFAULT_OPTIONS=compose:paus
XKB_DEFAULT_VARIANT=dvorak
XKB_INTERNAL_OPTIONS='compose:paus ctrl:nocaps'

## App-specific configuration
IDEA_PROPERTIES="$CONF/idea/idea.properties"
LESS=FMRi
PASSWORD_STORE_SIGNING_KEY="$( cat "$HOME/etc/secret/signing.key" )"
PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig"
RIPGREP_CONFIG_PATH="$CONF/ripgrep/config"
SUDO_ASKPASS="$HOME/bin/askpass"
_JAVA_AWT_WM_NONREPARENTING=1

set +a

# Set umask
umask 077

# SSH agent
[[ -r "$HOME/.ssh/agent.sh" ]] && . "$HOME/.ssh/agent.sh"

# Update SSH environment
f="$HOME/.ssh/environment"
rm -f "$f{new}"
grep -v '^PATH=' < "$f" > "$f{new}"
echo "PATH='$PATH'" >> "$f{new}"
mv -f "$f{new}" "$f"

# Hand off to X if requested
$startx
