#!/bin/sh

set -e

dir="$HOME/bin/wine"
mkdir -p "$dir"

while IFS=, read -r n d e
do
  if [[ -d "$HOME/.winefs/base/$n" && -d "$HOME/.winefs/live/$n" ]]
  then
    doas "$HOME/.winefs/mount" "$n"

    p="$( winepath -u "$d\\$e" )"
    if [[ -e "$p" ]]
    then
      rm -f "$dir/$n{new}"
      cat > "$dir/$n{new}" << END
#!/bin/sh
set -e
doas '\$HOME/.winefs/mount' '$n'
wine start /d '$d' '$d\\$e'
doas '\$HOME/.winefs/umount' '$n'
END

      chmod +x-w "$dir/$n{new}"

      cmp -s "$dir/$n" "$dir/$n{new}" || mv -f "$dir/$n{new}" "$dir/$n"
      rm -f "$dir/$n{new}"

      doas "$HOME/.winefs/umount" "$n"

      continue
    fi

    doas "$HOME/.winefs/umount" "$n"
  fi

  rm -f "$dir/$n"
done < "${0%.sh}.csv"
