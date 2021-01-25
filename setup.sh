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

# load env variables
eval "$(grep -v '#' $DIR/.env )"
echo "$(grep -v '#' $DIR/.env )"


# PREPROCESSING

mkdir -p "$DIR/build"


# for file in $DIR/*
# do
#   echo "$file"
#   # cp -r "$file" "$DIR/build/"
# done

for i in ${FILES[*]}
do
  echo "$DIR/$i"
  cp -r "$DIR/$i" "$DIR/build/"
done


# LINKING

if [ -e ~/.xmonad/xmonad.hs ]; then
  echo "old xmonad setting is stored to xmonad_old.hs"
  mv ~/.xmonad/xmonad.hs ~/.xmonad/xmonad_old.hs;
fi
cp $DIR/build/xmonad/xmonad.hs ~/.xmonad/xmonad.hs


# mkdir -p ~/.config/backups

# if [ -d ~/.config/dunst ]; then
#   echo "old dunst setting is stored to backups"
#   rm -r ~/.config/backups
#   mv ~/.config/dunst ~/.config/backups/
# fi
# cp -r $DIR/build/dunst ~/.config