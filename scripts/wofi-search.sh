#!/bin/bash

query=$(wofi --show dmenu -p "Wiki Search:" --width 250 --height 70)

if [[ -n "$query" ]]; then
    target=$(echo -e "Arch Wiki\nArtix Wiki" | wofi --show dmenu -i -p "Select Source:" --width 250 --height 130)

    if [[ -z "$target" ]]; then
        exit 0
    fi

    urlencode() {
        local string="${1}"
        local strlen=${#string}
        local encoded=""
        local pos c o
        
        for (( pos=0 ; pos<strlen ; pos++ )); do
            c="${string:$pos:1}"
            case "$c" in
                [-_.~a-zA-Z0-9]) 
                    o="${c}" 
                    ;;
                *) 
                    printf -v o '%%%02X' "'$c"
                    ;;
            esac
            encoded+="${o}"
        done
        echo "${encoded}"
    }

    encoded_query=$(urlencode "$query")

    case "$target" in
        "Arch Wiki")
            url="https://wiki.archlinux.org/index.php?search=${encoded_query}"
            ;;
        "Artix Wiki")
            url="https://wiki.artixlinux.org/index.php?action=search&q=${encoded_query}"
            ;;
        *)
            exit 1
            ;;
    esac
    
    xdg-open "$url" > /dev/null 2>&1 & disown
fi
