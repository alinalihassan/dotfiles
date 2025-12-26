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

# Jump - lazy loaded on first prompt for faster startup
function __jump_init --on-event fish_prompt
    functions --erase __jump_init  # Remove this function after first run
    source (jump shell fish | psub)
end

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
    if test (count $argv) -lt 2
        echo "Usage: fish_add_var VARIABLE VALUE"
        return 1
    end
    set -Ux $argv[1] $argv[2]
end

function fish_remove_var
    set --erase $argv
end

# Configure fzf.fish keybindings (Ctrl+F then letter)
# \cf = Ctrl+F, then the letter follows
fzf_configure_bindings --directory=\cff --history=\cfh --git_status=\cfs --git_log=\cfl --processes=\cfp --variables=\cfv

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
