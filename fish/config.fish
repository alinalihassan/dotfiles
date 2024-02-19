# Configure Jump

# Tmux
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
alias nvim="lvim"
alias v="nvim"
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
alias bk_reload='bk completion fish > ~/.config/fish/completions/bk.fish'

# Completions
## Booking BK CLI
## Instead of waiting for bk to run every time we open a shell
## We use it once and we update it when we install a plugin or update it
# bk completion fish | source # Very very slow, ~500ms

## Starship prompt
starship init fish | source

## Zoxide cd replacement
zoxide init --cmd cd fish | source

# Functions
function fish_add_var
    if count $argv > 1 
        set -Ux $argv[1] $argv[2]  
    else
        echo "Usage: fish_add_var VARIABLE VALUE"
    end
end

function fish_remove_var
    set --erase $argv
end
