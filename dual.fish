#!/bin/fish

if test "$argv[1]" = "on"

   if test "$argv[2]" = ""
      xrandr --output HDMI1 --auto --above eDP1 --rotate normal

   else if test "$argv[2]" = "inverted" -o "$argv[2]" = "left" -o "$argv[2]" = "right" -o "$argv[2]" = "normal"
      xrandr --output HDMI1 --auto --above eDP1 --rotate $argv[2]

   else
      echo "dual: orientation should be 'normal', 'inverted', 'left', right"
   end

else if test "$argv[1]" = "off"
   xrandr --output HDMI1 --off

else
   echo "Usage: dual (on [normal|inverted|left|right]|off)"
end
