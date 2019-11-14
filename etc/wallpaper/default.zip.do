redo-ifchange "$2.headers"

. ./digitalblasphemy.sh

uri="$uri/$2.zip"

redo-ifchange "$HOME/bin/pass2netrc"
pass2netrc "$key" | curl -Rs -o "$3" --netrc-file '/dev/fd/0' "$uri"
