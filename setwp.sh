#!/bin/bash

if [[ ! -d $HOME/Pictures/wallpaper ]]; then
   mkdir -p ~/Pictures/wallpapers
fi

ln -srf $1 ~/Pictures/wallpapers/main.jpg

bash ~/.fehbg &
