# Anmol's Arch Linux Dotfiles

My personal configuration files for Arch Linux with Hyprland window manager.

![Hyprland Setup](https://img.shields.io/badge/WM-Hyprland-blue)
![Terminal](https://img.shields.io/badge/Terminal-Alacritty-orange)
![Bar](https://img.shields.io/badge/Bar-Waybar-green)

## 🖥️ System Info

- **OS:** Arch Linux
- **WM:** Hyprland
- **Bar:** Waybar (2 configs - toggle with Super+Z)
- **Terminal:** Alacritty (primary), Kitty (backup)
- **Launcher:** Rofi
- **Editor:** Neovim
- **Wallpaper:** swww (dynamic wallpaper daemon)
- **Lock Screen:** Hyprlock
- **Night Light:** wlsunset

## 📦 Features

- **Dual Waybar Configs** - Toggle between two different status bar layouts
- **WiFi Menu** - Custom rofi-based WiFi selector
- **Clipboard Manager** - Cliphist integration with rofi
- **Screenshot Tools** - Grim + Slurp for screenshots
- **Blue Light Filter** - wlsunset with toggle script
- **Dynamic Wallpapers** - swww daemon for smooth transitions

## 🚀 Quick Install
```bash
# Clone repository
git clone https://github.com/anmol-chhetri-G/dotfiles-setup.git
cd dotfiles-setup

# Run install script
chmod +x setup.sh
./setup.sh
```

## ⌨️ Key Bindings

| Key Combination | Action |
|----------------|--------|
| `Super + Return` | Alacritty terminal |
| `Super + Q` | Close window |
| `Super + R` | Rofi launcher |
| `Super + Z` | Toggle Waybar configs |
| `Super + V` | Clipboard history |
| `Super + L` | Lock screen |
| `Super + Print` | Screenshot selection |
| `Print` | Full screenshot |

## 📁 Structure
```
.config/
├── hypr/          # Hyprland config
├── waybar/        # Waybar configs (2 variants)
├── alacritty/     # Terminal config
├── kitty/         # Backup terminal
├── rofi/          # App launcher
└── nvim/          # Neovim config

.local/bin/        # Custom scripts
Pictures/wallpapers/  # Wallpaper collection
```

## 🔧 Customization

### Change Terminal
Edit `.config/hypr/hyprland.conf`:
```conf
$terminal = alacritty  # or kitty
```

### Toggle Waybar Style
Press `Super + Z` or edit `~/.config/waybar/scripts/toggle-waybar.sh`

## 📝 Notes

- Location set for Nepal (27.7°N, 85.3°E) in wlsunset
- Monitor mirroring: HDMI-A-1 → eDP-1
- Adjust coordinates in hyprland.conf for your location

## 📄 License

MIT - Feel free to use and modify!
