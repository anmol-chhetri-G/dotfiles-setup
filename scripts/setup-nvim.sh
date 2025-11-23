#!/bin/bash
# =========================================
# NeoVim Configuration Setup
# =========================================

setup_neovim() {
    local DOTFILES_DIR="$HOME/dotfiles-setup"
    local NVIM_CONFIG="$HOME/.config/nvim"
    local PACKER_DIR="$HOME/.local/share/nvim/site/pack/packer/start/packer.nvim"
    
    # Clone dotfiles if not exists
    if [[ ! -d "$DOTFILES_DIR" ]]; then
        info "Cloning dotfiles repository..."
        git clone https://github.com/anmol-chhetri-G/dotfiles-setup.git "$DOTFILES_DIR"
    fi
    
    # Backup existing config if it exists
    if [[ -d "$NVIM_CONFIG" ]]; then
        warn "Backing up existing NeoVim config..."
        mv "$NVIM_CONFIG" "$NVIM_CONFIG.backup.$(date +%Y%m%d_%H%M%S)"
    fi
    
    # Copy new config
    info "Copying NeoVim configuration..."
    mkdir -p "$NVIM_CONFIG"
    cp -r "$DOTFILES_DIR/nvim/"* "$NVIM_CONFIG/"
    
    # Setup Packer
    if [[ -d "$PACKER_DIR" ]]; then
        warn "Removing existing Packer installation..."
        rm -rf "$PACKER_DIR"
    fi
    
    info "Installing Packer.nvim plugin manager..."
    git clone --depth 1 https://github.com/wbthomason/packer.nvim "$PACKER_DIR"
    
    # Install plugins
    info "Installing NeoVim plugins (this may take a moment)..."
    nvim --headless +PackerSync +qall 2>/dev/null
    
    success "NeoVim configuration complete!"
}
