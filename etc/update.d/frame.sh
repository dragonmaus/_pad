res=1600x1200

dest=/mnt/frame
src=$(xdg-user-dir BACKGROUNDS)/$res/digitalblasphemy

umount $dest 2> /dev/null || :
mount $dest || die 1 $0: Could not mount $dest

echo ">> Updating $src"
redo --no-log ~/etc/backgrounds/$res

echo ">> Cleaning up $dest"
ls -rt $dest | while read -r file
do
  name=${file#????-}
  [[ -e "$src/$name" ]] || rm -fv "$dest/$file"
done

echo ">> Importing from $src"
ls -rt $src | nl -nrz -w4 | while IFS='	' read -r num file
do
  file1=$src/$file
  for file2 in $dest/????-"$file"
  do
    [[ -e "$file2" ]] || file2=$dest/$num-$file
    if ! cmp -s "$file1" "$file2"
    then
      cp -fpv "$file1" "$file2"
      fsync "$file2" 2> /dev/null || :
    fi
  done
done

echo ">> Shuffling $dest"
el=$(tput el)
max=$(ls $dest | wc -l)
typeset -i -R${#max} count=0
ls $dest | shuf | nl -nrz -w4 | while IFS='	' read -r num file
do
  name=${file#????-}
  file1=$dest/$file
  file2=$dest/$num-$name
  [[ "$file1" == "$file2" ]] && continue
  ((count += 1))
  mv -v "$file1" "$file2" | sed "s:^:($count/$max) :;s/^/$el/;s:\$:\\r:" | tr -d '\n'
  fsync "$file2" 2> /dev/null || :
done
echo

umount $dest
