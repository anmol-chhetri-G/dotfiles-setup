# Anmol's Parrot OS i3 Dotfiles

Personal configuration for Parrot OS Security with i3 window manager.

![WM](https://img.shields.io/badge/WM-i3-blue)
![OS](https://img.shields.io/badge/OS-Parrot%20OS-green)
![Terminal](https://img.shields.io/badge/Terminal-Kitty-orange)
![Bar](https://img.shields.io/badge/Bar-Polybar-purple)
![Theme](https://img.shields.io/badge/Theme-Catppuccin%20Mocha-pink)

## 🖥️ System Info

- **OS:** Parrot OS Security (Debian Testing)
- **WM:** i3 with autotiling
- **Bar:** Polybar
- **Terminal:** Kitty
- **Launcher:** Rofi
- **Editor:** Vim
- **Night Light:** Redshift (X11)
- **Hardware:** Acer Predator Helios Neo 16 (Intel Raptor Lake + RTX 4050)

## 📦 Features

- **Autotiling** — smart split direction based on container size (like Hyprland)
- **CPU Auto-governor** — performance on AC, powersave on battery via udev
- **TLP** — battery power management
- **Night light toggle** — `$mod+n` to toggle redshift (3200K, Nepal coords)
- **Polybar dedup fix** — launch script prevents multiple instances on restart
- **Catppuccin Mocha/orange theme**

## 🚀 Quick Install

```bash
git clone -b parrot-i3 https://github.com/anmol-chhetri-G/dotfiles-setup.git
cd dotfiles-setup
```

### Configs
```bash
cp -r .config/i3 ~/.config/
cp -r .config/polybar ~/.config/
cp -r .config/kitty ~/.config/
chmod +x ~/.config/i3/*.sh
chmod +x ~/.config/polybar/launch.sh
```

### Required packages (Parrot/Debian)
```bash
sudo apt install i3 polybar kitty rofi dunst feh \
  autotiling python3-i3ipc \
  brightnessctl playerctl redshift \
  tlp tlp-rdw linux-cpupower \
  pactl pipewire wireplumber
```

### CPU governor (auto AC/battery)
```bash
sudo cp system/50-cpu-governor.rules /etc/udev/rules.d/
sudo udevadm control --reload-rules
```

### TLP
```bash
sudo systemctl enable --now tlp
sudo systemctl disable --now power-profiles-daemon
```

### Services to disable
```bash
sudo systemctl disable --now ModemManager
sudo systemctl disable --now samba-ad-dc
sudo systemctl disable NetworkManager-wait-online.service
```

## ⌨️ Key Bindings

| Key | Action |
|-----|--------|
| `$mod + Return` | Kitty terminal |
| `$mod + d` | Rofi launcher |
| `$mod + q` | Close window |
| `$mod + h/j/k/l` | Focus window (vim-style) |
| `$mod + Shift + h/j/k/l` | Move window |
| `$mod + 1-9` | Switch workspace |
| `$mod + Shift + 1-9` | Move to workspace |
| `$mod + n` | Toggle night light (redshift) |
| `$mod + Shift + r` | Reload i3 |
| `$mod + Shift + e` | Exit i3 |
| `XF86AudioRaiseVolume` | Volume +5% |
| `XF86AudioLowerVolume` | Volume -5% |
| `XF86AudioMute` | Toggle mute |
| `XF86MonBrightnessUp` | Brightness +10% |
| `XF86MonBrightnessDown` | Brightness -10% |

## 📁 Structure

```
.config/
├── i3/
│   ├── config              # Main i3 config
│   ├── nightlight.sh       # Redshift toggle
│   ├── touchpad-config.sh  # Touchpad settings
│   ├── touchpad-setup.sh
│   └── touchpad.sh
├── polybar/
│   ├── config.ini          # Polybar config
│   ├── launch.sh           # Safe launch (no duplicates)
│   └── scripts/            # Polybar scripts
└── kitty/
    ├── kitty.conf
    └── current-theme.conf  # Catppuccin Mocha

system/
└── 50-cpu-governor.rules   # udev: performance on AC, powersave on battery
```

## 🔧 Fedora Migration Notes

| Package | Parrot/Debian | Fedora |
|---------|--------------|--------|
| i3 | `apt install i3` | `dnf install i3` |
| polybar | `apt install polybar` | `dnf install polybar` |
| autotiling | `apt install autotiling` | `pip install autotiling` |
| brightnessctl | `apt install brightnessctl` | `dnf install brightnessctl` |
| TLP | `apt install tlp` | `dnf install tlp` |
| redshift | `apt install redshift` | `dnf install redshift` |

> On Fedora, also run: `sudo systemctl disable --now power-profiles-daemon` before enabling TLP.

## 📝 Notes

- Night light coordinates set for Kathmandu, Nepal (27.7°N, 85.3°E)
- Acer Predator Helios Neo 16 does **not** support battery charge limiting via Linux sysfs
- Check BIOS for built-in battery care option
- For Wayland/Hyprland setup, see the `main` branch

## 📄 License

MIT
