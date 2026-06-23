#!/bin/bash

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

DOTFILES_DIR="$HOME/dotfiles-setup"

echo -e "${BLUE}"
echo "╔═══════════════════════════════════════╗"
echo "║   Anmol's Dotfiles Setup Script       ║"
echo "║   Parrot OS + Hyprland + Noctalia     ║"
echo "╚═══════════════════════════════════════╝"
echo -e "${NC}"

# 1. Backup Existing Configs
echo -e "${YELLOW}[BACKUP]${NC} Creating backup of existing configs..."
BACKUP_DIR="$HOME/.config-backup-$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

# Backup common dirs and shell files
for item in rofi noctalia hypr nvim .zshrc fish; do
    if [ -e "$HOME/$item" ]; then
        cp -rf "$HOME/$item" "$BACKUP_DIR/"
    elif [ -e "$HOME/.config/$item" ]; then
        cp -rf "$HOME/.config/$item" "$BACKUP_DIR/"
    fi
done
echo -e "${GREEN}[SUCCESS]${NC} Backup created at: $BACKUP_DIR"

# 2. Link Configs (The "Safe" Way)
echo -e "${YELLOW}[INSTALL]${NC} Linking configurations..."

# Create necessary directories
mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/bin"

# Link Noctalia
echo "Configuring Noctalia..."
ln -sfn "$DOTFILES_DIR/configs/noctalia" "$HOME/.config/noctalia"

# Link Rofi
echo "Configuring Rofi..."
ln -sfn "$DOTFILES_DIR/configs/rofi" "$HOME/.config/rofi"

# Link Shell (.zshrc)
echo "Configuring Shell..."
ln -sf "$DOTFILES_DIR/configs/shell/.zshrc" "$HOME/.zshrc"

# Link Fish config
echo "Configuring Fish..."
mkdir -p "$HOME/.config/fish"
ln -sf "$DOTFILES_DIR/.config/fish/config.fish" "$HOME/.config/fish/config.fish"

# Link Wallpapers
echo "Setting up wallpapers..."
mkdir -p "$HOME/Pictures"
ln -sfn "$DOTFILES_DIR/Pictures/wallpapers" "$HOME/Pictures/wallpapers"

# 3. Permissions
echo -e "${YELLOW}[POST-INSTALL]${NC} Setting permissions..."
find "$DOTFILES_DIR/scripts/" -type f -name "*.sh" -exec chmod +x {} \;

echo -e "\n${GREEN}╔═══════════════════════════════════════╗"
echo -e "║      Installation Complete! 🎉        ║"
echo -e "╚═══════════════════════════════════════╝${NC}\n"

echo -e "${YELLOW}Next steps:${NC}"
echo "1. Source your shell: source ~/.zshrc"
echo "2. Restart your compositor if needed."
