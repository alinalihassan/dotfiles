# Configure Jump
status --is-interactive; and source (jump shell fish | psub)


# Aliases
alias nvim="lvim"
alias v="nvim"
alias cat="bat"
alias ack="ag"
alias python="python3"
alias find="fd"
alias grep="rg"
alias ls="eza --icons --hyperlink --ignore-glob='.DS_Store'"
alias l="ls -la --git"
alias ll="ls -l --git"
alias lt="ls -TL=2"
alias reload='exec fish'

# Completions
## Booking BK CLI
# bk completion fish | source # Very very slow, ~500ms

## Starship prompt
starship init fish | source

# Tmux
# Adapted from https://github.com/fish-shell/fish-shell/issues/4434#issuecomment-332626369
# only run in interactive (not automated SSH for example)
# if status is-interactive and not set -q TMUX
#   tmux new-session -A -s main
# end
