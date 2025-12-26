#!/bin/bash

query=$(wofi --show dmenu -p "Search:" --width 300 --height 50)

if [[ -n "$query" ]]; then
    wiki_choice=$(echo -e "arch\nartix" | wofi --show dmenu -p "Wiki:" --width 200 --height 60)
    
    if [[ "$wiki_choice" == "artix" ]]; then
        page_name=$(echo "$query" | sed 's/ /_/g')
        page_name="$(tr '[:lower:]' '[:upper:]' <<< ${page_name:0:1})${page_name:1}"
        xdg-open "https://wiki.artixlinux.org/Main/${page_name}"
    else
        clean_query=$(echo "$query" | sed 's/ /+/g')
        xdg-open "https://wiki.archlinux.org/index.php?search=${clean_query}"
    fi
fi
