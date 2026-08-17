#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m'

DOTFILES_DIR="$HOME/dotfiles-setup"

echo -e "${BLUE}"
echo "╔═══════════════════════════════════════╗"
echo "║   Anmol's Dotfiles Setup Script       ║"
echo "║   Parrot OS + Zsh + Fish              ║"
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

echo -e "${YELLOW}[1/5]${NC} Installing zsh, fish, and fonts..."
sudo apt update
sudo apt install -y zsh fish fonts-powerline git curl

echo -e "${YELLOW}[2/5]${NC} Installing Oh My Zsh + Powerlevel10k..."
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" 2>/dev/null || true

echo -e "${YELLOW}[3/5]${NC} Installing zsh syntax highlighting + autosuggestions..."
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" 2>/dev/null || true
git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions.git \
    "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" 2>/dev/null || true

echo -e "${YELLOW}[4/5]${NC} Installing dotfiles (zsh + fish + niri)..."
install_path "$DOTFILES_DIR/configs/parrot/shell/.zshrc" "$HOME/.zshrc"
install_path "$DOTFILES_DIR/configs/parrot/fish/config.fish" "$HOME/.config/fish/config.fish"
install_path "$DOTFILES_DIR/configs/parrot/niri/config.kdl" "$HOME/.config/niri/config.kdl"

echo -e "${YELLOW}[5/5]${NC} Installing wallpapers..."
install_path "$DOTFILES_DIR/Pictures/wallpapers" "$HOME/Pictures/wallpapers"

echo -e "\n${GREEN}╔═══════════════════════════════════════╗"
echo -e "║      Installation Complete! 🎉        ║"
echo -e "╚═══════════════════════════════════════╝${NC}\n"

echo -e "${YELLOW}Next steps:${NC}"
echo "1. chsh -s \$(which zsh)   # set zsh as default shell"
echo "2. exec zsh                 # or run 'fish' to use fish"
echo "3. Run 'p10k configure' to style the prompt."
