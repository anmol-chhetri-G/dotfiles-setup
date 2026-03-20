#!/bin/bash
if pgrep -x "redshift" >/dev/null; then
    killall redshift
else
    redshift -t 4500:3500 -l 27.7:85.3 -b 1.0:0.9 &
fi
