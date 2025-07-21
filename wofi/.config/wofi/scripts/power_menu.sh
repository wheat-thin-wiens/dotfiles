#!/usr/bin/bash

show_power_menu() {
  local menu_options="\u200B Lock
  \u200C󰤄 Sleep
  \u200D Relaunch
  \u2060󰜉 Restart
  󰐥\u2063 Shutdown"

  local selection=$(echo -e "$menu_options" | wofi --show dmenu --prompt "Power Options" --width 200 --height 250 -0 alphabetical)
  case "$selection" in
    *Lock*) hyprlock ;;
    *Sleep*) systemctl suspend ;;
    *Relaunch*) hyprctl dispatch exit ;;
    *Restart*) systemctl reboot ;;
    *Shutdown*) systemctl poweroff ;;
  esac
}

show_power_menu

# CHOSEN=$(printf "Lock\nSuspend\nReboot\nShutdown\nLog Out" | rofi --config "$HOME"/.config/rofi/powermenu-config)
#
# case "$CHOSEN" in
# 	"Lock") lockscreen ;;
# 	"Suspend") systemctl suspend-then-hibernate ;;
# 	"Reboot") reboot ;;
# 	"Shutdown") poweroff ;;
# 	"Log Out") hyprctl dispatch exit ;;
# 	*) exit 1 ;;
# esac
