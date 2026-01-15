#!/bin/bash

choice=$(echo -e "Reboot\nShutdown" | wofi --dmenu --prompt="Power Menu" --height=150 --width=250)

case "$choice" in
    "Reboot")
        confirm=$(echo -e "Yes\nNo" | wofi --dmenu --prompt="Reboot?" --height=150 --width=200)
        if [ "$confirm" = "Yes" ]; then
            pkill -15 -x hyprland
            loginctl reboot
        fi
        ;;
    "Shutdown")
        confirm=$(echo -e "Yes\nNo" | wofi --dmenu --prompt="Shutdown?" --height=150 --width=200)
        if [ "$confirm" = "Yes" ]; then
            pkill -15 -x hyprland
            loginctl poweroff
        fi
        ;;
esac
