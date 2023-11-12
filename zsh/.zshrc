# ZSH Options
export ZSH="$HOME/.oh-my-zsh"
export ZSH_CUSTOM="~/.dotfiles/zsh/custom"

ZSH_THEME="robbyrussell"

plugins=(
  git
  zsh-syntax-highlighting
  zsh-autosuggestions
  web-search
  macos
  1password
)

source $ZSH/oh-my-zsh.sh

# Options
## Starship prompt
eval "$(starship init zsh)"

## 1Password CLI
eval "$(op completion zsh)"; compdef _op op

## WezTerm
setopt COMBINING_CHARS

## Command Redirects
alias nvim="lvim"
alias cat="bat"
alias ag="ack"
alias python="python3"
alias find="fd"
alias grep="rg"

## Environment variables
export EDITOR=nvim
export VISUAL=$EDITOR

## PATH additions
export PATH="$HOME/bin:$PATH" # Custom binaries
export PATH="/usr/local/bin:$PATH"
export PATH="/Users/alinalihassan/.local/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
