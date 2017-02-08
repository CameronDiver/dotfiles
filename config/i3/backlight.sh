#!/bin/bash

percent=$(xbacklight -get)
percent=$(printf %.0f $percent)

if [ "$percent" -gt "9" ]; then
  step=10
else
  step=1
fi
printf %d $step

if [ "$1" == "+" ]; then
    exec xbacklight -inc $step
else
    echo "down"
    exec xbacklight -dec $step
fi
