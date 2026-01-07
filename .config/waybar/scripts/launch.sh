# ~/.config/waybar/scripts/reload.sh
#!/bin/sh
pkill waybar
# Optional: wait a tiny bit
sleep 0.05
# Start new instance (Hyprland runs this directly → no terminal)
waybar >/dev/null 2>&1 &
