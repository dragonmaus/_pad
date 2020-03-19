#!/bin/sh

mkexe() {
  rm -f "$1{new}"
  cat > "$1{new}"
  chmod +x-w "$1{new}"
  cmp -s "$1" "$1{new}" || mv -f "$1{new}" "$1"
  rm -f "$1{new}"
}

set -e

bindir="$HOME/bin/wine"
mkdir -p "$bindir"
mkexe "$bindir/winefs" << 'END'
#!/bin/sh
exec doas "$HOME/.winefs/$1" "$2"
END

winefs="$HOME/.winefs"

while IFS=, read -r name path command
do
  bin="$bindir/$name"

  if [[ ! -d "$winefs/base/$name" || ! -d "$winefs/live/$name" ]]
  then
    rm -f "$bin"
    continue
  fi

  winefs mount "$name"

  wbin="$path\\$command"

  if [[ ! -e "$( winepath -u "$wbin" )" ]]
  then
    winefs umount
    rm -f "$bin{new}"
    continue
  fi

  mkexe "$bin" << END
#!/bin/sh
set -e
winefs mount '$name'
wine start /d '$path' '$wbin'
winefs umount
END

  winefs umount
done < "${0%.sh}.csv"
