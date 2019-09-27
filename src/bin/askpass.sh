#!/bin/sh

echo() {
	print -r -- "$*"
}

prompt="$( echo $1 )"
shift

temp="$( mktemp -d )"
chmod 0700 "$temp"

rm -fr "$temp/pipe"
mkfifo -m 0600 "$temp/pipe"
sed -n 's/^D //p' < "$temp/pipe" &
exec > "$temp/pipe"
rm -f "$temp/pipe"
rm -fr "$temp"

exec pinentry-smart << END
OPTION lc-ctype=${LC_ALL:-${LC_CTYPE:-${LANG:-C}}}
OPTION ttyname=$( tty )
OPTION ttytype=$TERM
SETDESC $*
SETPROMPT ${prompt:-Password:}
GETPIN
END
