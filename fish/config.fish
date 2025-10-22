# Configure Jump

# Tmux
# Using Ghostty multiplexers instead
# Adapted from https://github.com/fish-shell/fish-shell/issues/4434#issuecomment-332626369
# only run in interactive (not automated SSH for example)
# if status is-interactive
# # don't nest inside another tmux
# and not set -q TMUX
#   # Adapted from https://unix.stackexchange.com/a/176885/347104
#   # Create session 'main' or attach to 'main' if already exists.
#   tmux new-session -A -s main
# end

# Jump
status --is-interactive; and source (jump shell fish | psub)

# Aliases
alias v="nvim"
alias vim="nvim"
alias cat="bat"
# alias cd="z" # Already aliased by zoxide init
alias df="duf"
alias ack="ag"
alias python="python3"
alias find="fd"
alias grep="rg"
alias ls="eza --icons --ignore-glob='.DS_Store'"
alias l="ls -la --git"
alias ll="ls -l --git"
alias lt="ls -TL=2"
alias reload='exec fish'

## Zoxide cd replacement
zoxide init --cmd cd fish | source

# Functions
function fish_add_var
    if count $argv -ne 1 
        set -Ux $argv[1] $argv[2]  
    else
        echo "Usage: fish_add_var VARIABLE VALUE"
    end
end

function fish_remove_var
    set --erase $argv
end


# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
