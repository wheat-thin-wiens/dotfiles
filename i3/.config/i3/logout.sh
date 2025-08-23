#!/bin/bash

killall -q polybar

i3-nagbar -t warning -m 'Really log out?' -b 'Yes, exit' 'sudo killall Xorg'
