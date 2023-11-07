#!/usr/bin/env bash

# Add this script to your wm startup file.

DIR="$HOME/.config/polybar/docky"

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

screens=$(xrandr --listactivemonitors | grep -v Monitor | cut -d" " -f6)

bar=0
for screen in $screens; do
    # Launch the bar
    bar=$(( $bar+1 ))
    MONITOR=$screen polybar --reload -q "$bar" -c "$DIR"/config.ini &
done

