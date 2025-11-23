#!/bin/bash
# =========================================
# Utility Functions
# =========================================

# Colors for output
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
CYAN='\033[1;36m'
RED='\033[1;31m'
NC='\033[0m' # No Color

# Yes/No prompt helper
ask() {
    while true; do
        read -rp "$1 [y/n]: " yn
        case $yn in
            [Yy]* ) return 0;;
            [Nn]* ) return 1;;
            * ) echo "Please answer y or n.";;
        esac
    done
}

# Success message
success() {
    echo -e "${GREEN}✅ $1${NC}"
}

# Info message
info() {
    echo -e "${CYAN}➡ $1${NC}"
}

# Warning message
warn() {
    echo -e "${YELLOW}⚠ $1${NC}"
}

# Error message
error() {
    echo -e "${RED}❌ $1${NC}"
}
