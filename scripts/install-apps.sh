#!/bin/bash
# =========================================
# Application Installation
# =========================================

install_from_list() {
    local list_name="$1"
    local apps_file="$DOTFILES_DIR/configs/packages/${list_name}.txt"
    
    if [[ ! -f "$apps_file" ]]; then
        warn "Package list not found at $apps_file"
        return 1
    fi
    
    info "Installing packages from $list_name..."
    
    if [[ "$PM" == "apt" ]]; then
        sudo apt update
    fi
    
    while IFS= read -r pkg || [[ -n "$pkg" ]]; do
        [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue
        info "Installing $pkg..."
        eval $INSTALL_CMD "$pkg" 2>/dev/null || warn "Failed to install $pkg"
    done < "$apps_file"
    
    success "$list_name installation complete"
}

install_main_apps() {
    install_from_list "core"
    install_from_list "i3"
    install_from_list "dev"
    install_from_list "apps"
}
