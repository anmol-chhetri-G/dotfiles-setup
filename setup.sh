#!/bin/bash
# =========================================
# Main Setup Script
# =========================================

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Source utilities and modules
source "$SCRIPT_DIR/scripts/utils.sh"
source "$SCRIPT_DIR/scripts/detect-system.sh"
source "$SCRIPT_DIR/scripts/system-update.sh"
source "$SCRIPT_DIR/scripts/install-apps.sh"
source "$SCRIPT_DIR/scripts/setup-nvim.sh"

# =========================================
# Main execution
# =========================================

echo -e "${CYAN}╔════════════════════════════════════════╗${NC}"
echo -e "${CYAN}║     Dotfiles Setup Script             ║${NC}"
echo -e "${CYAN}╔════════════════════════════════════════╗${NC}"
echo ""

# Detect system
detect_system

# Update system
if ask "Do you want to update the system?"; then
    update_system
fi

# Install applications
if ask "Do you want to install main applications?"; then
    install_main_apps
fi

# Setup NeoVim
if ask "Do you want to set up NeoVim config?"; then
    setup_neovim
fi


# Optional Hyprland Setup
read -p "Set up Hyprland environment? (y/n): " setup_hypr
if [ "$setup_hypr" = "y" ]; then
    source scripts/setup-hyprland.sh
    setup_hyprland
fi

# Final message
echo ""
echo -e "${GREEN}╔════════════════════════════════════════╗${NC}"
echo -e "${GREEN}║  ✅ Setup completed successfully!     ║${NC}"
echo -e "${GREEN}╚════════════════════════════════════════╝${NC}"
