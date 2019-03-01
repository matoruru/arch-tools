#!/bin/bash

# Usage
# screenshot.sh  displaying time  zoom ratio  [--focused]

if [[ ! -d $HOME/Pictures/Screenshots/ ]]; then
   mkdir -p ~/Pictures/Screenshots
fi
cd          ~/Pictures/Screenshots

tmpname=_____scReeNshoT-tmP.png
if [[ -f $tmpname ]]; then
   exit
fi

newname=$( scrot -q 100 $3 '%Y-%m-%d-%T-screenshot.png' -e 'echo $f' )
ln -s $newname $tmpname

# To make $disptime from 0 to 5
if   [[ $(echo "$1 <= 0" | bc) -eq 1 ]]; then
   echo "redefine $1 as 0.1..."
   disptime=0.1
elif [[ $(echo "$1 >  5" | bc) -eq 1 ]]; then
   echo "redefine $1 as 5..."
   disptime=5
else
   disptime=$1
fi

zoomratio=$2

timeout $disptime feh --fullscreen --zoom $zoomratio $tmpname

# if $disptime is lower than 1, after sleep 1 - $disptime, rm
if [[ $(echo "$disptime < 1" | bc) -eq 1 ]]; then
   sleep $(echo "1 - $disptime" | bc)
fi
rm $tmpname
