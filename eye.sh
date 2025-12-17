#!/bin/bash

INTERVAL=20
DURATION=20
LOCK_FILE="/tmp/eye-break-lock"
SHORT_BREAK_COUNT=0
LONG_BREAK_COUNT=0

for arg in "$@"; do
    case $arg in
        --interval=*)
            INTERVAL="${arg#*=}"
            ;;
        --duration=*)
            DURATION="${arg#*=}"
            ;;
    esac
done

while true; do
    sleep $((INTERVAL * 60))
    
    touch "$LOCK_FILE"
    
    if [ $SHORT_BREAK_COUNT -lt 2 ]; then
        hyprctl dispatch exec "[float; size 325 200; center] kitty --title 'Eye Break' --class=eye-break -e bash -c 'printf \"\033[1;31m\"; echo \"========================\"; echo \"     EYE BREAK TIME!\"; echo \"========================\"; printf \"\033[0m\"; echo \"Look away for $DURATION seconds\"; echo \"\"; for i in {$DURATION..1}; do echo -ne \"\\\rTime left: \$i seconds\"; sleep 1; done; echo -e \"\\\rBreak finished!                \"; sleep 2'"
        SHORT_BREAK_COUNT=$((SHORT_BREAK_COUNT + 1))
        rm -f "$LOCK_FILE"
        sleep $DURATION
    else
        SHORT_BREAK_COUNT=0
        
        if [ $LONG_BREAK_COUNT -eq 0 ]; then
            hyprctl dispatch exec "[float; size 325 200; center] kitty --title 'Long Eye Break' --class=eye-break -e bash -c 'printf \"\033[1;32m\"; echo \"========================\"; echo \"    LONG BREAK TIME!\"; echo \"========================\"; printf \"\033[0m\"; echo \"Look away for 5 minutes\"; echo \"\"; for i in {300..1}; do echo -ne \"\\\rTime left: \$i seconds\"; sleep 1; done; echo -e \"\\\rBreak finished!                \"; sleep 2'"
            LONG_BREAK_COUNT=1
            rm -f "$LOCK_FILE"
            sleep 300
        else
            hyprctl dispatch exec "[float; size 325 200; center] kitty --title 'Extra Long Eye Break' --class=eye-break -e bash -c 'printf \"\033[1;34m\"; echo \"========================\"; echo \" EXTRA LONG BREAK TIME!\"; echo \"========================\"; printf \"\033[0m\"; echo \"Look away for 10 minutes\"; echo \"\"; for i in {600..1}; do echo -ne \"\\\rTime left: \$i seconds\"; sleep 1; done; echo -e \"\\\rBreak finished!                \"; sleep 2'"
            LONG_BREAK_COUNT=0
            rm -f "$LOCK_FILE"
            sleep 600
        fi
    fi
done
