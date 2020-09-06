#!/bin/bash

# Usage
# screenshot.sh  displaying time  zoom ratio  [--focused]

disptime=$1
zoomratio=$2
focused=$3

mkdir -p ~/Pictures/Screenshots
cd       ~/Pictures/Screenshots

newname=$( scrot -q 100 $focused '%Y-%m-%d-%T-screenshot.png' -e 'echo $f' )

timeout $disptime feh --fullscreen --zoom $zoomratio $newname
