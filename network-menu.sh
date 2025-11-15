#!/bin/bash

while true; do
    MENU_ITEMS="📡 Connect to Wi-Fi
📡 Connect to wired
🔌 Disconnect
🔄 Restart NetworkManager
🚪 Exit"

    CHOICE=$(echo -e "$MENU_ITEMS" | wofi --dmenu --prompt="Network" --width=300 --height=250)

    case "$CHOICE" in
        "📡 Connect to Wi-Fi")
            wifi_list=$(nmcli --fields "SSID,SECURITY,SIGNAL" device wifi list | sed '1d' | awk -F'  +' '{print $1 " | " $2 " | " $3 "%"}' | sort -u)
            SELECTED_WIFI=$(echo -e "$wifi_list" | wofi --dmenu --prompt="Wi-Fi" --width=400 --height=300)
            
            if [ -n "$SELECTED_WIFI" ]; then
                SSID=$(echo "$SELECTED_WIFI" | cut -d'|' -f1 | sed 's/ *$//')
                
                if echo "$SELECTED_WIFI" | grep -q "none"; then
                    nmcli device wifi connect "$SSID"
                else
                    PASSWORD=$(wofi --dmenu --password --prompt="Password" --width=350 --height=200)
                    if [ -n "$PASSWORD" ]; then
                        nmcli device wifi connect "$SSID" password "$PASSWORD" 2>/dev/null || \
                        notify-send "Network" "Failed to connect to $SSID"
                    fi
                fi
            fi
            ;;
        
        "📡 Connect to wired")
            nmcli connection up "$(nmcli -t -f NAME,TYPE connection show | grep ethernet | cut -d: -f1 | head -1)" 2>/dev/null || \
            notify-send "Network" "Failed to connect to wired"
            ;;
        
        "🔌 Disconnect")
            active_connections=$(nmcli -t -f NAME,DEVICE connection show --active | grep -v ':--' | cut -d: -f1)
            if [ -n "$active_connections" ]; then
                SELECTED_CONNECTION=$(echo "$active_connections" | wofi --dmenu --prompt="Disconnect" --width=300 --height=200)
                if [ -n "$SELECTED_CONNECTION" ]; then
                    nmcli connection down "$SELECTED_CONNECTION"
                fi
            else
                notify-send "Network" "No active connections"
            fi
            ;;
        
        "🔄 Restart NetworkManager")
            PASSWD=$(wofi --dmenu --password --prompt="sudo password" --width=300 --height=200)
            if [ -n "$PASSWD" ]; then
                echo "$PASSWD" | sudo -S systemctl restart NetworkManager 2>/dev/null
                notify-send "Network" "NetworkManager restarted"
            fi
            ;;
        
        "🚪 Exit")
            exit 0
            ;;
    esac
done
