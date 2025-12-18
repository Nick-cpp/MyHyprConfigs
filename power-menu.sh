#!/bin/bash

choice=$(echo -e "Reboot\nShutdown" | wofi --dmenu --prompt="Power Menu" --height=120 --width=250)

case "$choice" in
    "Reboot")
        confirm=$(echo -e "Yes\nNo" | wofi --dmenu --prompt="Reboot?" --height=100 --width=200)
        if [ "$confirm" = "Yes" ]; then
            reboot
        fi
        ;;
    "Shutdown")
        confirm=$(echo -e "Yes\nNo" | wofi --dmenu --prompt="Shutdown?" --height=100 --width=200)
        if [ "$confirm" = "Yes" ]; then
            poweroff
        fi
        ;;
esac
