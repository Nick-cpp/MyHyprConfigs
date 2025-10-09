#!/bin/bash

# Меню с опциями питания
choice=$(echo -e "Reboot\nShutdown" | wofi --dmenu --prompt="Power Menu" --height=120 --width=250)

case "$choice" in
    "Reboot")
        # Перезагрузка
        confirm=$(echo -e "Yes\nNo" | wofi --dmenu --prompt="Reboot?" --height=100 --width=200)
        if [ "$confirm" = "Yes" ]; then
            systemctl reboot
        fi
        ;;
    "Shutdown")
        # Выключение
        confirm=$(echo -e "Yes\nNo" | wofi --dmenu --prompt="Shutdown?" --height=100 --width=200)
        if [ "$confirm" = "Yes" ]; then
            systemctl poweroff
        fi
        ;;
esac
