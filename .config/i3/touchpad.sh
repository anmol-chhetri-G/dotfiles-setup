#!/bin/bash

# Natural scrolling
xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Scrolling Distance" -111 -111 2>/dev/null || true
xinput set-prop "SYNA2B0E:00 06CB:7D49" "libinput Natural Scrolling Enabled" 1 2>/dev/null || true

# Two-finger right-click
xinput set-prop "SynPS/2 Synaptics TouchPad" "Synaptics Edge Right Button" 1 2>/dev/null || true
xinput set-prop "SYNA2B0E:00 06CB:7D49" "libinput Middle Emulation Enabled" 1 2>/dev/null || true

echo "Touchpad configured"
