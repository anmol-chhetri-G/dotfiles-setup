#!/bin/bash
# =========================================
# Application Installation
# =========================================

install_main_apps() {
    local apps_file="$SCRIPT_DIR/config/main-apps.txt"
    
    if [[ ! -f "$apps_file" ]]; then
        warn "Apps list not found at $apps_file"
        return 1
    fi
    
    info "Installing main applications..."
    
    # Update package list for Debian-based systems
    if [[ "$PM" == "apt" ]]; then
        sudo apt update
    fi
    
    # Read apps from file and install
    while IFS= read -r pkg || [[ -n "$pkg" ]]; do
        # Skip empty lines and comments
        [[ -z "$pkg" || "$pkg" =~ ^# ]] && continue
        
        info "Installing $pkg..."
        eval $INSTALL_CMD "$pkg" 2>/dev/null || warn "Failed to install $pkg (may not be available)"
    done < "$apps_file"
    
    success "Application installation complete"
}
