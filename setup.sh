#!/bin/bash
# Colors for output
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color

# start with update 

# ----------------------------------------
# Update system
# ----------------------------------------
echo -e "${YELLOW}➡ Updating system packages...${NC}"
sudo pacman -Syu --noconfirm

MAIN_APPS=(
	git base-devel neofetch htop curl wget vim nano tmux
	zsh unzip unrar p7zip obsidian wireshark python3 go google-chrome 
	firefox localsend kitty ffuf smplayer vlc vim nvim ventory
	tealdeer chromium code onlyoffice-bin 
	)

# Setup install
echo -e "${GREEN}🔧 Starting system setup...${NC}"

echo "Installing Obsidian"
sudo pacman -Syu --noconfirm "${MAIN_APPS[@]}"



