#!/usr/bin/env bash

set -e

echo "🙏 Deep breaths, everything will (probably) be fine!"
echo ""

# Setting up
## location of the *full repo* (defaults to ~/.dotfiles)
DOTFILES_PATH="${DOTFILES_PATH:="$HOME/.dotfiles"}"
## location of this script (should be right next to all the other files, but we handle that next if it's not)
INSTALLER_PATH="$(dirname "$(realpath "${BASH_SOURCE[0]}")")"

## if this is a codespace, link automatically cloned dotfiles repo to the expected DOTFILES_PATH
## https://docs.github.com/en/codespaces/troubleshooting/troubleshooting-personalization-for-codespaces#troubleshooting-dotfiles
if [[ "$CODESPACES" = "true" ]] && [[ -d /workspaces/.codespaces/.persistedshare/dotfiles ]]; then
  ln -sf /workspaces/.codespaces/.persistedshare/dotfiles "$DOTFILES_PATH"
fi

## clone this repo if this script is all by itself and/or we're not in the expected location
if [[ "$INSTALLER_PATH" != "$DOTFILES_PATH" ]] && [[ ! -d "$DOTFILES_PATH" ]]; then
  git clone https://github.com/alinalihassan/dotfiles.git "$DOTFILES_PATH"

  echo "Successfully cloned the full repo to '$DOTFILES_PATH'"
  echo "Run install.sh from that directory to continue. Exiting now..."
  exit 0
fi

# Symlinks
## Setup .config directory
if [[ ! -d ~/.config ]]; then
  mkdir -p ~/.config
fi
## Zsh
ln -sf "$DOTFILES_PATH/zsh/.zshrc" ~/.zshrc
## Git
ln -sf "$DOTFILES_PATH/git/.gitconfig" ~/.gitconfig
ln -sf "$DOTFILES_PATH/git/.gitignore_global" ~/.gitignore_global
## Starship
ln -sf "$DOTFILES_PATH/starship/config.toml" ~/.config/starship.toml
## Wezterm
ln -sf "$DOTFILES_PATH/wezterm" ~/.config/wezterm
## LunarVim
ln -sf "$DOTFILES_PATH/lvim" ~/.config/lvim

# Oh My Zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Homebrew
## Ensure Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "Homebrew is not installed. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

## Symlink Brewfile
ln -sf "$DOTFILES_PATH/Brewfile" ~/.Brewfile

## Update Homebrew and install packages from Brewfile
brew update
brew bundle --file=~/.Brewfile

# LunarVim
if ! command -v lvim &> /dev/null; then
    echo "LunarVim is not installed. Installing..."
    LV_BRANCH='release-1.3/neovim-0.9'
    bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
fi

# Finalize logging
echo ""
echo "🎉 It actually worked!"
echo "Log out and log back in (or just restart) to finish installing all ZSH features."
