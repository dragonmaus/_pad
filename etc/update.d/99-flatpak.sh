echo '>> Updating flatpak wrapper scripts'
(
  wrappers=
  for w in aoss apulse optirun
  do
    which $w > /dev/null 2>&1 && wrappers="$wrappers $w"
  done

  mkexe() {
    rm -f $1{new}
    cat > $1{new}
    chmod +x-w $1{new}
    cmp -s $1 $1{new} || mv -f $1{new} $1
    rm -f $1{new}
  }

  bindir=~/bin/flat
  mkdir -p $bindir

  while IFS=, read -r name id
  do
    [[ $name = Name ]] && continue

    bin=$bindir/$name

    if ! flatpak info "$id" > /dev/null 2>&1
    then
      rm -f $bin
      continue
    fi

    mkexe $bin << END
#!/bin/sh
mkdir -p ~/log/flat
exec$wrappers flatpak run '$id' > ~/log/flat/$name.log 2>&1
END
  done < ~/etc/flat.csv
)
