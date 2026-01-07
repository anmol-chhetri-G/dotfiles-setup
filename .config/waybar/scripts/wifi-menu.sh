#!/usr/bin/env bash

# Configuration
ROFI_THEME="$HOME/.config/rofi/config.rasi"
IFACE=$(nmcli -t -f DEVICE,TYPE device | awk -F: '$2=="wifi"{print $1; exit}')

# Get current connection
CONNECTED=$(nmcli -t -f ACTIVE,SSID dev wifi | awk -F: '$1=="yes"{print $2}')

# Build menu
MENU=""

if [ -n "$CONNECTED" ]; then
    MENU+="󰖪 Disconnect from $CONNECTED\n"
    MENU+="󰁡 Forget $CONNECTED\n"
    MENU+="────────────────────\n"
fi

# Rescan and get networks (with deduplication)
nmcli device wifi rescan 2>/dev/null
sleep 1

# Get unique networks sorted by signal strength
NETWORKS=$(nmcli -f SSID,SECURITY,SIGNAL device wifi list | \
    tail -n +2 | \
    awk '!seen[$1]++ {printf "%s|%s|%s\n", $1, $2, $3}' | \
    sort -t'|' -k3 -rn)

# Get saved connections
SAVED=$(nmcli -t -f NAME connection show | grep -v "lo\|docker\|virbr")

# Build network list
while IFS='|' read -r ssid security signal; do
    [ -z "$ssid" ] && continue
    
    # Icon based on signal
    if [ "$signal" -ge 75 ]; then
        icon=""
    elif [ "$signal" -ge 50 ]; then
        icon=""
    elif [ "$signal" -ge 25 ]; then
        icon=""
    else
        icon=""
    fi
    
    # Check if saved
    if echo "$SAVED" | grep -Fxq "$ssid"; then
        MENU+="$icon $ssid (saved) [$signal%]\n"
    else
        MENU+="$icon $ssid [$signal%]\n"
    fi
done <<< "$NETWORKS"

# Show menu
CHOICE=$(echo -e "$MENU" | rofi -dmenu -i -p "WiFi" -theme "$ROFI_THEME")

[ -z "$CHOICE" ] && exit 0

# Handle disconnect
if echo "$CHOICE" | grep -q "^󰖪 Disconnect"; then
    nmcli device disconnect "$IFACE"
    notify-send "WiFi" "Disconnected from $CONNECTED"
    exit 0
fi

# Handle forget
if echo "$CHOICE" | grep -q "^󰁡 Forget"; then
    nmcli connection delete "$CONNECTED"
    notify-send "WiFi" "Forgot network $CONNECTED"
    exit 0
fi

# Extract SSID
SSID=$(echo "$CHOICE" | sed 's/^[^ ]* //; s/ (saved)//; s/ \[.*//; s/^ *//')

# Check if saved network
if echo "$SAVED" | grep -Fxq "$SSID"; then
    if nmcli connection up "$SSID" 2>/dev/null; then
        notify-send "WiFi" "Connected to $SSID"
    else
        notify-send -u critical "WiFi" "Failed to connect to $SSID"
    fi
    exit 0
fi

# New network - prompt for password
PASSWORD=$(rofi -dmenu -password -p "Password for $SSID" -theme "$ROFI_THEME")
[ -z "$PASSWORD" ] && exit 0

if nmcli device wifi connect "$SSID" password "$PASSWORD" 2>/dev/null; then
    notify-send "WiFi" "Connected to $SSID"
else
    notify-send -u critical "WiFi" "Failed to connect to $SSID"
fi
