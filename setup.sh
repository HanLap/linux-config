#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"


if [ -e ~/.xmonad/xmonad.hs ]; then
  echo "old xmonad setting is stored to xmonad_old.hs"
  mv ~/.xmonad/xmonad.hs ~/.xmonad/xmonad_old.hs;
fi
ln -sv $DIR/xmonad/xmonad.hs ~/.xmonad/xmonad.hs
