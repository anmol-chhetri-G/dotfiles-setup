#!/bin/bash
# =========================================
# System Detection
# =========================================

detect_system() {
    info "Detecting Linux distribution..."
    
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
        
        if [[ "$ID" == "arch" ]] || [[ "$ID_LIKE" == *"arch"* ]]; then
            PM="pacman"
            INSTALL_CMD="sudo pacman -S --noconfirm"
            UPDATE_CMD="sudo pacman -Syu --noconfirm"
        elif [[ "$ID" == "ubuntu" ]] || [[ "$ID" == "debian" ]] || [[ "$ID" == "parrot" ]] || [[ "$ID_LIKE" == *"debian"* ]]; then
            PM="apt"
            INSTALL_CMD="sudo apt install -y"
            UPDATE_CMD="sudo apt update && sudo apt upgrade -y"
        else
            error "Unsupported OS: $ID"
            exit 1
        fi
    else
        error "Cannot detect OS. Exiting."
        exit 1
    fi
    
    success "Detected package manager: $PM"
    export PM INSTALL_CMD UPDATE_CMD
}
