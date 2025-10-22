# Dotfiles

This repository contains my personal configuration files (dotfiles) for macOS.

## Contents

- [bat](https://github.com/alinalihassan/dotfiles/blob/main/bat): Bat configuration
- [brew](https://github.com/alinalihassan/dotfiles/blob/main/brew): Homebrew configuration
- [fish](https://github.com/alinalihassan/dotfiles/blob/main/fish): Fish shell configuration
- [ghostty](https://github.com/alinalihassan/dotfiles/blob/main/ghostty): Ghostty terminal configuration
- [lazygit](https://github.com/alinalihassan/dotfiles/blob/main/lazygit): LazyGit configuration
- [git](https://github.com/alinalihassan/dotfiles/blob/main/git): Git configuration 
- [nvim](https://github.com/alinalihassan/dotfiles/blob/main/lvim): Neovim configuration
- [vscode](https://github.com/alinalihassan/dotfiles/blob/main/vscode): Vscode configuration

## Installation

To set up a new system with these dotfiles, run the install.sh script:
```bash
git clone --recurse-submodules https://github.com/alinalihassan/dotfiles.git ~/.dotfiles
cd ~/.dotfiles && ./install.sh
```

This will symlink the files in this repo to your home directory and install any necessary dependencies.
