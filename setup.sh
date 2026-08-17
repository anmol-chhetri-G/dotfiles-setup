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
echo "║   Arch Linux + Hyprland + Noctalia    ║"
echo "╚═══════════════════════════════════════╝"
echo -e "${NC}"

# Choose install mode: symlink or independent copy
echo -e "${YELLOW}Install mode:${NC}"
echo "  1) Symlinks (keep configs in sync with dotfiles repo)"
echo "  2) Independent copies (free to edit, no auto-sync)"
while true; do
    read -p "Choose [1/2] (default 1): " MODE
    MODE="${MODE:-1}"
    if [ "$MODE" = "1" ] || [ "$MODE" = "2" ]; then
        break
    fi
    echo -e "${RED}Invalid choice, enter 1 or 2.${NC}"
done

install_path() {
    local src="$1" dst="$2"
    mkdir -p "$(dirname "$dst")"
    if [ "$MODE" = "2" ]; then
        cp -rf "$src" "$dst"
        echo -e "${GREEN}[COPY]${NC} $dst"
    else
        ln -sfn "$src" "$dst"
        echo -e "${GREEN}[LINK]${NC} $dst -> $src"
    fi
}

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

# Install Noctalia
echo "Configuring Noctalia..."
install_path "$DOTFILES_DIR/configs/noctalia" "$HOME/.config/noctalia"

# Install Rofi
echo "Configuring Rofi..."
install_path "$DOTFILES_DIR/configs/rofi" "$HOME/.config/rofi"

# Install Shell (.zshrc)
echo "Configuring Shell..."
install_path "$DOTFILES_DIR/configs/shell/.zshrc" "$HOME/.zshrc"

# Install Fish config
echo "Configuring Fish..."
install_path "$DOTFILES_DIR/.config/fish/config.fish" "$HOME/.config/fish/config.fish"

# Install Niri
echo "Configuring Niri..."
install_path "$DOTFILES_DIR/configs/arch/niri/config.kdl" "$HOME/.config/niri/config.kdl"

# Install Wallpapers
echo "Setting up wallpapers..."
install_path "$DOTFILES_DIR/Pictures/wallpapers" "$HOME/Pictures/wallpapers"

# 3. Permissions
echo -e "${YELLOW}[POST-INSTALL]${NC} Setting permissions..."
find "$DOTFILES_DIR/scripts/" -type f -name "*.sh" -exec chmod +x {} \;

echo -e "\n${GREEN}╔═══════════════════════════════════════╗"
echo -e "║      Installation Complete! 🎉        ║"
echo -e "╚═══════════════════════════════════════╝${NC}\n"

echo -e "${YELLOW}Next steps:${NC}"
echo "1. Source your shell: source ~/.zshrc"
echo "2. Restart your compositor if needed."
