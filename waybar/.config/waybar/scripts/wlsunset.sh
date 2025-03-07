#!/bin/bash

if pgrep -x "wlsunset" 
then
  pkill wlsunset
else
  wlsunset -T 5000 &
fi
