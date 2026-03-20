#!/bin/bash

# ELAN Touchpad ID
TOUCHPAD=11

echo "Configuring ELAN touchpad (ID: $TOUCHPAD)..."

# Enable tap to click (most important)
xinput set-prop $TOUCHPAD "libinput Tapping Enabled" 1

# Natural scrolling
xinput set-prop $TOUCHPAD "libinput Natural Scrolling Enabled" 1

# Two-finger right-click (middle emulation)
xinput set-prop $TOUCHPAD "libinput Middle Emulation Enabled" 1

# Disable accel
xinput set-prop $TOUCHPAD "libinput Accel Speed" 0

# Enable clickfinger method (two-finger tap = right click)
xinput set-prop $TOUCHPAD "libinput Click Method Enabled" 0 1

echo "✓ Touchpad configured!"
echo ""
echo "Settings applied:"
xinput list-props $TOUCHPAD | grep -E "Tapping Enabled|Natural Scrolling|Middle Emulation|Click Method"
