#################
#### ALIASES ####
#################

alias suka="su -c "archarchive""
alias m="micro"
alias g="git"
alias c="clear"
alias fucking="sudo"
alias nyaofetch="fastfetch"
alias wmconf="m ~/.config/hypr/hyprland.conf"

if status is-interactive
end
set -U fish_greeting
function super
    su -c "$argv"
end
function sp
    su -c "pacman $argv"
end
