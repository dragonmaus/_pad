#!/bin/sh

mkexe() {
  rm -f "$1.new"
  cat > "$1.new"
  chmod +x-w "$1.new"
  cmp -s "$1" "$1.new" || mv -f "$1.new" "$1"
  rm -f "$1.new"
}

set -e

bindir="$HOME/bin/wine"
mkdir -p "$bindir"

prefix="$HOME/.wineprefix"

while IFS=, read -r name path command
do
  bin="$bindir/$name"
  dir="$prefix/$name"

  if [[ ! -d "$dir" ]]
  then
    rm -f "$bin"
    continue
  fi

  export WINEPREFIX="$dir"

  wbin="$path\\$command"

  if [[ ! -e "$(winepath -u "$wbin")" ]]
  then
    rm -f "$bin"
    continue
  fi

  mkexe "$bin" << END
#!/bin/sh
exec env WINEPREFIX='$dir' wine start /d '$path' '$wbin' "\$@"
END
done < "${0%.sh}.csv"
