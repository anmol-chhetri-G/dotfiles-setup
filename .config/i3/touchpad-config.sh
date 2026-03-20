#!/bin/bash

# Get touchpad device name
TOUCHPAD=$(xinput list | grep -i "touchpad\|synaptics\|elan\|alps" | awk '{print $NF}' | sed 's/id=//')

if [ -z "$TOUCHPAD" ]; then
    TOUCHPAD=$(xinput list | grep -i "mouse" | grep -i "touch" | awk '{print $NF}' | sed 's/id=//')
fi

if [ -n "$TOUCHPAD" ]; then
    echo "Configuring touchpad: $TOUCHPAD"
    
    # Enable tap-to-click
    xinput set-prop "$TOUCHPAD" "libinput Tapping Enabled" 1 2>/dev/null || \
    xinput set-prop "$TOUCHPAD" "Synaptics Tap Action" 1 1 1 2>/dev/null || true
    
    # Natural scrolling
    xinput set-prop "$TOUCHPAD" "libinput Natural Scrolling Enabled" 1 2>/dev/null || \
    xinput set-prop "$TOUCHPAD" "Synaptics Scrolling Distance" -111 -111 2>/dev/null || true
    
    # Two-finger right-click (middle button emulation)
    xinput set-prop "$TOUCHPAD" "libinput Middle Emulation Enabled" 1 2>/dev/null || \
    xinput set-prop "$TOUCHPAD" "Synaptics Edge Right Button" 1 2>/dev/null || true
    
    # Disable mouse acceleration (optional but recommended)
    xinput set-prop "$TOUCHPAD" "libinput Accel Speed" 0 2>/dev/null || true
    
    # Tap-to-click speed
    xinput set-prop "$TOUCHPAD" "libinput Tapping Button Map Primary" 1 2>/dev/null || true
    
    echo "Touchpad configured successfully!"
else
    echo "No touchpad found"
fi
