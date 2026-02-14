#################
#### ALIASES ####
#################

alias sp="sudo pacman"
alias g="git"
alias c="clear"
alias fucking="sudo"
alias wmconf="vim ~/.config/hypr/"
alias plant="cbonsai"
alias wifi="sudo impala"

if status is-interactive
    set phrases \
        "Linux is not a kernel, it's a way of life." \
        "Touch grass? I prefer touch /dev/random." \
        "My RAM, my rules." \
        "You should touch some grass." \
        "Your kernel is $(uname -sr)"

    set random_index (random 1 (count $phrases))

    set_color cyan
    echo -e "\e[3m$phrases[$random_index]\e[0m"
    set_color normal
end
set -U fish_greeting
function super
    su -c "$argv"
end
function fish_prompt
    set -l cyan (set_color cyan)
    set -l blue (set_color blue)
    set -l normal (set_color normal)

    echo -n -s $normal " " $cyan (prompt_pwd) $magenta " ➜ " $normal
end

function on_exit --on-event fish_exit
    printf "\e[?25l"
end
