#!/bin/bash

if [ "$1" = "dual" ]; then
  # Laptop right of ext screen
  #xrandr --output eDP1 --auto --pos 3584x0 --output DP1 --auto --scale 1.4x1.4 --pos 0x0 --fb 6144x2016 && xbacklight -set 100 && pkill -RTMIN+1 i3blocks

  # Laptop left of ext screen
  # xrandr --output eDP1 --auto --pos 0x0 --output DP1 --auto --scale 1.4x1.4 --pos 2560x0 --fb 6144x2016
  xrandr --output eDP1 --auto --pos 0x0 --output HDMI1 --auto --scale 1.4x1.4 --pos 2560x0 --fb 6144x2016 
fi
if [ "$1" = "laptop" ]; then
  xrandr --output eDP1 --auto --output HDMI1 --off
fi

~/.fehbg && xbacklight -set 100 && pkill -RTMIN+1 i3blocks
