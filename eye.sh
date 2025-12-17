#!/bin/bash

INTERVAL=20
DURATION=20
LOCK_FILE="/tmp/eye-break-lock"

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
    
    hyprctl dispatch exec "[float; size 325 200; center] kitty --title 'Eye Break' --class=eye-break -e bash -c 'printf \"\033[1;31m\"; echo \"========================\"; echo \"     EYE BREAK TIME!\"; echo \"========================\"; printf \"\033[0m\"; echo \"Look away for $DURATION seconds\"; echo \"\"; for i in {$DURATION..1}; do echo -ne \"\\\rTime left: \$i seconds\"; sleep 1; done; echo -e \"\\\rBreak finished!                \"; sleep 2'"
    
    rm -f "$LOCK_FILE"
    sleep $DURATION
done
