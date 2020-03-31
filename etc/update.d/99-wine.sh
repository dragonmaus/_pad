echo '>> Updating wine wrapper scripts'
(
  mkexe() {
    rm -f $1{new}
    cat > $1{new}
    chmod +x-w $1{new}
    cmp -s $1 $1{new} || mv -f $1{new} $1
    rm -f $1{new}
  }

  bindir=~/bin/wine
  mkdir -p $bindir

  base=~/.wineprefix

  while IFS=, read -r prefix name path command
  do
    bin=$bindir/$name
    dir=$base/$prefix

    if [[ ! -d $dir ]]
    then
      rm -f $bin
      continue
    fi

    export WINEPREFIX=$dir

    wbin="$path\\$command"

    if [[ ! -e "$(winepath -u "$wbin")" ]]
    then
      rm -f $bin
      continue
    fi

    mkexe $bin << END
#!/bin/sh
exec env WINEPREFIX='$dir' wine start /d '$path' '$wbin' "\$@"
END
  done < ~/etc/wine.csv
)
