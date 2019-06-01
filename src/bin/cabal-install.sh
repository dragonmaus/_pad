#!/bin/sh

echo() {
  print -nr -- "$*" 1>&2
}

set -e

root=$(mktemp -d)
trap -- 'rm -fr $root' EXIT INT KILL TERM

bindir=$HOME/lang/haskell/bin
prefix=$HOME/.cabal
mkdir -pv $bindir
mkdir -pv $prefix

cd $root

for spec do
  echo "Fetching package $spec..."
  dir=$(cabal get "$spec" | tee /dev/fd/2 | sed -n 's/^Unpacking to //;s/\/$//p')

  (
    cd "$dir"

    cabal sandbox init

    echo "Installing dependencies..."
    cabal install --only-dependencies

    echo "Installing package..."
    cabal install --prefix=$prefix --bindir=$bindir

    echo "Cleaning up..."
  )
  rm -fr "$dir"
done
