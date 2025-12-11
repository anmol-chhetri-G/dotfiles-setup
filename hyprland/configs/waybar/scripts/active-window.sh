#!/bin/sh

# Exit if already running (avoid duplicates)
if pgrep -f "active-window.sh" | grep -v "$$"; then
    exit 0
fi

# Connect to Hyprland's event socket and react to focus changes
socat - UNIX-CONNECT:"$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" 2>/dev/null \
| while IFS= read -r line; do
    if [[ $line == "activewindow>>"* ]]; then
        # Extract everything after "activewindow>>"
        data="${line#activewindow>>}"

        # If empty (e.g., desktop), show fallback
        if [ -z "$data" ]; then
            echo '{"text": "Desktop", "class": "desktop", "icon": ""}'
            continue
        fi

        # Split into class and title (Hyprland sends: class,title)
        class=$(echo "$data" | cut -d',' -f1 | tr '[:upper:]' '[:lower:]')
        title=$(echo "$data" | cut -d',' -f2-)

        # Fallback if class is empty
        if [ -z "$class" ] || [ "$class" = "null" ]; then
            echo '{"text": "Desktop", "class": "desktop", "icon": ""}'
            continue
        fi

        # Choose display text: title if short, else class
        if [ ${#title} -gt 25 ] || [ -z "$title" ]; then
            display="$class"
        else
            display="$title"
        fi
        display=$(echo "$display" | cut -c -25)

        # Map class → icon
        case "$class" in
            firefox)                icon="" ;;
            chromium|google-chrome|brave-browser) icon="" ;;
            code|vscodium)          icon="" ;;
            kitty|alacritty|foot|wezterm) icon="" ;;
            discord)                icon="" ;;
            spotify)                icon="" ;;
            telegram*)              icon="" ;;
            signal)                 icon="" ;;
            obsidian)               icon="" ;;
            zathura|evince)         icon="" ;;
            mpv|vlc)                icon="" ;;
            gimp)                   icon="" ;;
            inkscape)               icon="" ;;
            libreoffice*)           icon="" ;;
            steam)                  icon="" ;;
            thunar|nautilus|nemo)   icon="" ;;
            obs)                    icon="" ;;
            pavucontrol)            icon="" ;;
            nvim|vim)               icon="" ;;
            *)                      icon="󰈹" ;;
        esac

        # Output JSON (Waybar reads each line as an update)
        printf '{"text": "%s", "icon": "%s"}\n' \
            "$(echo "$display" | sed 's/"/\\"/g')" "$icon"
    fi
done
