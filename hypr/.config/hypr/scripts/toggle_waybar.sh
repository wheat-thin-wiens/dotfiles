#!/bin/bash

if pgrep -x waybar > /dev/null; then
  killall waybar
else
  $HOME/.config/waybar/launch.sh
fi
