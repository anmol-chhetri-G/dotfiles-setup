#!/bin/sh
# Toggle between default and Omarchy Waybar themes

CONFIG_DIR="$HOME/.config/waybar"
STATE_FILE="$CONFIG_DIR/.current-waybar"

# Read current mode
if [ -f "$STATE_FILE" ]; then
    MODE=$(cat "$STATE_FILE")
else
    MODE="default"
fi

# Kill current waybar
killall waybar 2>/dev/null

# Toggle and launch
case "$MODE" in
    "default")
        echo "omarchy" > "$STATE_FILE"
        exec waybar -c "$CONFIG_DIR/config-omarchy.jsonc" -s "$CONFIG_DIR/style-omarchy.css" &
        ;;
    "omarchy")
        echo "default" > "$STATE_FILE"
        exec waybar -c "$CONFIG_DIR/config.jsonc" -s "$CONFIG_DIR/style.css" &
        ;;
esac
