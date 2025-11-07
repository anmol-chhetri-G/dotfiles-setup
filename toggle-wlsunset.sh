#!/bin/bash
# location= ~/.local/bin 
if pgrep -x "wlsunset" > /dev/null; then
    killall wlsunset
else
    wlsunset -t 3500 -T 6500 -g 0.9 -l 27.7 -L 85.3 &
fi

# COmmand key bindings
# exec-once = wlsunset -l 27.7 -L 85.3 -t 3500 -T 4500
# bind = $mainMod, L, exec, ~/.local/bin/toggle-wlsunset.sh
