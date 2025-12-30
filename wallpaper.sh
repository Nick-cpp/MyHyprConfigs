#!/bin/bash

WALLPAPER=$(find ~/Pictures/Wallpapers/ -type f | shuf -n1)

swww img "$WALLPAPER" --transition-type none

HYPRLOCK_CONFIG="$HOME/.config/hypr/hyprlock.conf"
sed -i "s|path = .*|path = $WALLPAPER|" "$HYPRLOCK_CONFIG"
