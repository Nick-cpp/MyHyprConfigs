#################
#### ALIASES ####
#################

alias sp="sudo pacman"
alias g="git"
alias c="clear"
alias fucking="sudo"
alias wmconf="vim ~/.config/hypr/hyprland.conf"
alias plant="cbonsai"

if status is-interactive
end
set -U fish_greeting
function super
    su -c "$argv"
end
