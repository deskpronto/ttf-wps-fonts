#!/bin/bash

 mkdir /usr/share/fonts/wps-fonts

cp *.ttf /usr/share/fonts/wps-fonts
cp *.TTF /usr/share/fonts/wps-fonts
chmod 644 /usr/share/fonts/wps-fonts/*
fc-cache -vfs

