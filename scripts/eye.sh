#!/bin/bash

INTERVAL=20
DURATION=20
LOCK_FILE="/tmp/eye-break-lock"
SHORT_BREAK_COUNT=0
LONG_BREAK_COUNT=0

for arg in "$@"; do
    case $arg in
        --interval=*) INTERVAL="${arg#*=}" ;;
        --duration=*) DURATION="${arg#*=}" ;;
    esac
done

spawn_break_window() {
    local title="$1"
    local time=$2
    local color=$3

    foot --app-id "eye-break" --title "$title" \
        -o "pad=18x10" \
        -e bash -c "
            printf \"\033[1;${color}m\"
            echo \"========================\"
            echo \"    $title\"
            echo \"========================\"
            printf \"\033[0m\"
            echo \"Rest for $time seconds\"
            echo \"\"
            for i in \$(seq $time -1 1); do
                mins=\$((i/60))
                secs=\$((i%60))
                printf \"\rTime left: %02d:%02d\e[K\" \$mins \$secs
                sleep 1
            done
            printf \"\rDone!\e[K\"
            sleep 0.5
        " > /dev/null 2>&1
}

while true; do
    [ "$INTERVAL" -gt 0 ] && sleep $((INTERVAL * 60)) || sleep 1
    touch "$LOCK_FILE"
    
    if [ $SHORT_BREAK_COUNT -lt 2 ]; then
        spawn_break_window "EYE BREAK TIME!" "$DURATION" "31"
        SHORT_BREAK_COUNT=$((SHORT_BREAK_COUNT + 1))
    else
        SHORT_BREAK_COUNT=0
        if [ $LONG_BREAK_COUNT -eq 0 ]; then
            spawn_break_window "LONG BREAK TIME!" 300 "32"
            LONG_BREAK_COUNT=1
        else
            spawn_break_window "EXTRA LONG BREAK TIME!" 600 "34"
            LONG_BREAK_COUNT=0
        fi
    fi
    rm -f "$LOCK_FILE"
done
