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
function fish_prompt
    set -l green (set_color green)
    set -l cyan (set_color cyan)
    set -l blue (set_color blue)
    set -l normal (set_color normal)

    echo -n -s $green $USER $normal " " $cyan (prompt_pwd) $magenta " ➜ " $normal
end
