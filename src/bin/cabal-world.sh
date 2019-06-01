#!/bin/sh

set -e

cd $HOME

world=$HOME/.cabal.world

cmd=$1
shift

case $cmd in
  install|update)
    cabal v2-update

    while read -u 3 name; do
      case $name in
        --*)
          continue
          ;;
        */*)
          test -d $name || continue
          (cd $name && cabal v2-clean && rm -f .ghc.environment.* && cabal v2-install .)
          ;;
        *)
          cabal v2-install $name
          ;;
      esac
    done 3<$world
    ;;
esac
