pkill -f waybar
sleep 0.1
waybar >/dev/null 2>&1 &
disown

# Optional: show a tiny toast (requires notify-send)
notify-send "Waybar reloaded" -t 300 -h int:transient:1
