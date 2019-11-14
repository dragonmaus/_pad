redo-always

. ./digitalblasphemy.sh

uri="$uri/$2.zip"

redo-ifchange "$HOME/bin/pass2netrc"
pass2netrc "$key" | curl -ILs --netrc-file '/dev/fd/0' "$uri" | grep -iv '^Date: ' | redo-stamp
