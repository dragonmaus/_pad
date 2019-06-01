#!/bin/sh

set -e

echo() {
  print -nr -- "$*" 1>&2
}

root=$HOME/.hackage

cmd=$1
shift

case $cmd in
  install)
    mkdir -pv $root/repo/package
    for file do
      echo "Installing package $file..."
      cp -f "$file" $root/repo/package/
    done
    exec $0 update
    ;;
  reinit)
    echo "Reinitializing repository..."
    find $root -not \( -path $root/repo/package -prune \) -print0 | sort -rz | xargs -0 rm -df >/dev/null 2>&1 || :
    mkdir -pv $root/repo/package
    hackage-repo-tool create-keys --keys $root/keys
    hackage-repo-tool bootstrap --keys $root/keys --repo $root/repo
    exec $0 update
    ;;
  update)
    exec hackage-repo-tool update --keys $root/keys --repo $root/repo
    ;;
esac
