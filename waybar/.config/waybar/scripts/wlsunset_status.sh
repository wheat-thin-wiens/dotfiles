#!/bin/bash

if pgrep -x "wlsunset"
then
  return "on"
else
  return "false"
fi
