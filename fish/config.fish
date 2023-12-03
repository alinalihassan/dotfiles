# Configure Jump
status --is-interactive; and source (jump shell fish | psub)

# Adapted from https://github.com/fish-shell/fish-shell/issues/4434#issuecomment-332626369
# only run in interactive (not automated SSH for example)
if status is-interactive
# don't nest inside another tmux
and not set -q TMUX
  # Adapted from https://unix.stackexchange.com/a/176885/347104
  # Create session 'main' or attach to 'main' if already exists.
  tmux new-session -A -s main
end

# Aliases
alias nvim="lvim"
alias cat="bat"
alias ag="ack"
alias python="python3"
alias find="fd"
alias grep="rg"
alias ls="eza --icons --hyperlink --ignore-glob='.DS_Store'"
alias l="ls -la --git"
alias ll="ls -l --git"
alias lt="ls -TL=2"
alias v="nvim"
alias reload='exec fish'

# Completions
## Booking BK CLI
bk completion fish | source

## Starship prompt
starship init fish | source
