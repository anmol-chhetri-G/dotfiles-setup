#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

echo -e "${BLUE}"
echo "╔═══════════════════════════════════════╗"
echo "║   Anmol's Dotfiles Setup Script      ║"
echo "║   Arch Linux + Hyprland               ║"
echo "╚═══════════════════════════════════════╝"
echo -e "${NC}"

# Backup
echo -e "${YELLOW}[BACKUP]${NC} Creating backup..."
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

for dir in hypr waybar alacritty kitty rofi nvim; do
    if [ -d "$HOME/.config/$dir" ]; then
        cp -r "$HOME/.config/$dir" "$BACKUP_DIR/"
    fi
done

echo -e "${GREEN}[SUCCESS]${NC} Backup: $BACKUP_DIR"

# Copy configs
echo -e "${YELLOW}[INSTALL]${NC} Installing configs..."
cp -r .config/* "$HOME/.config/"
mkdir -p "$HOME/.local/bin"
cp -r .local/bin/* "$HOME/.local/bin/"

# Make scripts executable
chmod +x "$HOME/.config/waybar/scripts/"*.sh
chmod +x "$HOME/.local/bin/"*

# Setup default Waybar
cd "$HOME/.config/waybar"
ln -sf config-default.jsonc config.jsonc
ln -sf style-default.css style.css

echo -e "\n${GREEN}╔═══════════════════════════════════════╗"
echo -e "║     Installation Complete! 🎉        ║"
echo -e "╚═══════════════════════════════════════╝${NC}\n"

echo -e "${YELLOW}Next steps:${NC}"
echo -e "1. Log out"
echo -e "2. Select 'Hyprland' session"
echo -e "3. Log in and enjoy!\n"

echo -e "${BLUE}Key bindings:${NC}"
echo -e "  Super + Return → Terminal"
echo -e "  Super + R      → Launcher"
echo -e "  Super + Z      → Toggle Waybar"
echo -e "  Super + V      → Clipboard"
