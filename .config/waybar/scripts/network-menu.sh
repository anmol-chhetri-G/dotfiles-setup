#!/bin/sh
CHOICE=$(echo -e "Rescan\nConnect to Wi-Fi\nEthernet Settings\nVPN\nOpen Network Manager" | \
    rofi -dmenu -i -p " Network" -theme ~/.config/rofi/config.rasi)

case "$CHOICE" in
    "Rescan")          nmcli dev wifi rescan ;;
    "Connect to Wi-Fi")nmcli dev wifi list | rofi -dmenu -i -p "Select Wi-Fi" | \
                       awk '{print $2}' | xargs -r nmcli dev wifi connect ;;
    "Ethernet Settings")nm-connection-editor ;;
    "VPN")             nm-connection-editor ;;
    "Open Network Manager") nm-connection-editor ;;
    *)                 exit 0 ;;
esac
