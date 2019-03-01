#!/bin/bash

if [[ ! -d $HOME/Pictures/wallpaper ]]; then
   mkdir -p ~/Pictures/wallpaper
fi

ln -srf $1 ~/Pictures/wallpaper/main.jpg

bash ~/.fehbg &
