#!/bin/sh
source scripts/utils.sh

setup_hyprland() {
    info "Setting up Hyprland environment..."

    # Install packages
    if [ "$DISTRO" = "arch" ]; then
        info "Installing Hyprland packages (Arch)..."
        sudo pacman -S --needed --noconfirm $(cat config/hyprland-apps.txt)
    elif [ "$DISTRO" = "debian" ]; then
        warning "Hyprland not in Debian repos — please install manually or use AUR helper."
        # Or add auto-build from source (advanced)
    fi

    # Deploy configs
    mkdir -p ~/.config
    cp -r hyprland/configs/* ~/.config/

    success "Hyprland setup complete! Reboot to apply."
}
