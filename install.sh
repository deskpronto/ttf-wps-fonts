#!/bin/bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

if [[ $(id -u) -ne 0 ]] ; then
  exit 1
fi

HOME_FONT="$HOME/.fonts"
MOST_DISTROS="/usr/share/fonts"

if test -e $MOST_DISTROS ; then
        FONT_PATH=$MOST_DISTROS
else
        FONT_PATH=$HOME_FONT
fi

FONT_PATH=$FONT_PATH"/wps-fonts"

if [ -d "$FONT_PATH" ]; then
  while read -r -t 0; do read -r; done 
  if [[ $REPLY == "" ]]; then
    exit 0
  elif [[ $REPLY =~ ^[Nn]$ ]]; then
    exit 0
  fi
fi

if [[ $REPLY =~ ^[Nn]$ ]]; then
  exit 0
fi

if [ ! -d "$FONT_PATH" ]; then
  mkdir $FONT_PATH
fi

cp *.ttf $FONT_PATH
cp *.TTF $FONT_PATH
chmod 644 $FONT_PATH/*
fc-cache -vfs

exit 0
