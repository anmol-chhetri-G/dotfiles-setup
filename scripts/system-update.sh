#!/bin/bash
# =========================================
# System Update
# =========================================

update_system() {
    info "Updating system packages..."
    eval $UPDATE_CMD
    success "System updated successfully"
}
