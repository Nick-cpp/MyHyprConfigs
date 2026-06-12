#################
#### ALIASES ####
#################

alias g="git"
alias c="clear"
alias fucking="doas"
alias wmconf="vim ~/.config/hypr/hyprland.lua"
alias wifi="impala"
alias dv="doas vim"
alias ff="fastfetch --config ~/.config/fastfetch/gentoo.jsonc"

if status is-interactive
end
set -U fish_greeting
function super
    su -c "$argv"
end
function fish_prompt
    set -l cyan (set_color cyan)
    set -l blue (set_color blue)
    set -l normal (set_color normal)

    echo -n -s $normal " " $cyan (prompt_pwd) $blue " ➜ " $normal
end

function on_exit --on-event fish_exit
    printf "\e[?25l"
end
