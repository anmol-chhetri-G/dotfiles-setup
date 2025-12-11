#!/bin/sh
# Power menu using rofi (without custom theme)

chosen=$(printf "  Shutdown\n  Reboot\n  Logout\n  Suspend\n  Lock" | \
    rofi -dmenu -i -p "⏾ Power Menu" -font "JetBrainsMono Nerd Font 12")

case "$chosen" in
    *"Shutdown"*)      systemctl poweroff ;;
    *"Reboot"*)        systemctl reboot ;;
    *"Logout"*)        hyprctl dispatch exit ;;
    *"Suspend"*)       systemctl suspend ;;
    *"Lock"*)          hyprlock ;;
    *)                 exit 1 ;;
esac
