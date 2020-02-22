#!/bin/sh

set -e

bindir="$HOME/bin/wine"
mkdir -p "$bindir"

winefs="$HOME/.winefs"

while IFS=, read -r name path command
do
  bin="$bindir/$name"

  if [[ ! -d "$winefs/base/$name" || ! -d "$winefs/live/$name" ]]
  then
    rm -f "$bin"
    continue
  fi

  doas "$winefs/mount" "$name"

  wbin="$path\\$command"

  if [[ ! -e "$( winepath -u "$wbin" )" ]]
  then
    doas "$winefs/umount"
    rm -f "$bin{new}"
    continue
  fi

  rm -f "$bin{new}"
  cat > "$bin{new}" << END
#!/bin/sh
set -e
doas '$winefs/mount' '$name'
wine start /d '$path' '$wbin'
doas '$winefs/umount'
END

  chmod +x-w "$bin{new}"

  cmp -s "$bin" "$bin{new}" || mv -f "$bin{new}" "$bin"
  rm -f "$bin{new}"

  doas "$winefs/umount"
done < "${0%.sh}.csv"
