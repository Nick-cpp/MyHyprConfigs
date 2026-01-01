#!/bin/bash

WALLPAPER=$(find ~/Pictures/Wallpapers/ -type f | shuf -n1)

swww img "$WALLPAPER" \
    --transition-type grow \
    --transition-pos center \
    --transition-duration 0.5 \
    --transition-fps 144

HYPRLOCK_CONFIG="$HOME/.config/hypr/hyprlock.conf"
sed -i "s|path = .*|path = $WALLPAPER|" "$HYPRLOCK_CONFIG"
