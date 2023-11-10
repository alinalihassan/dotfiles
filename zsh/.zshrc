# ZSH Options
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
  web-search
  macos
)

source $ZSH/oh-my-zsh.sh

# Options
## Starship prompt
eval "$(starship init zsh)"

## WezTerm
setopt COMBINING_CHARS

## Command Redirects
alias nvim="lvim"
alias cat="bat"
alias ag="ack"
alias python="python3"
alias find="fd"
alias grep="rg"

## Others
export PATH="$HOME/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
export PATH="/Users/alinalihassan/.local/bin:$PATH"

