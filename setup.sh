#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

FILES=(
  'xmonad'
  'dunst'
  'eww'
  'fontconfig'
  'rofi'
  'tint2'
  'gtk-3.0'
  'alacritty.yml'
  'picom.conf'
)

# PREPROCESSING

mkdir -p "$DIR/build"
for i in ${FILES[*]}
do
  echo "$DIR/$i"
  cp -r "$DIR/$i" "$DIR/build/$i"
done


# LINKING

if [ -e ~/.xmonad/xmonad.hs ]; then
  echo "old xmonad setting is stored to xmonad_old.hs"
  mv ~/.xmonad/xmonad.hs ~/.xmonad/xmonad_old.hs;
fi
ln -sv $DIR/build/xmonad/xmonad.hs ~/.xmonad/xmonad.hs


mkdir -p ~/.config/backups

if [ -d ~/.config/dunst ]; then
  echo "old dunst setting is stored to backups"
  mv ~/.config/dunst ~/.config/backups/dunst
fi
ln -sv $DIR/build/dunst ~/.config/dunst