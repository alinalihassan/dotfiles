# Dotfiles

This repository contains my personal configuration files (dotfiles) for macOS and Arch Linux.

## Installation

### Prerequisites

Before running the installation script, ensure you have:
- macOS 12 or later **or** Arch Linux
- Git installed
- For macOS: Command Line Tools: `xcode-select --install`

### Quick Start

```bash
git clone --recurse-submodules https://github.com/alinalihassan/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
bunx dotbash
./install
```

### What the Installation Does

The installation process uses **Dotbot** to automate setup:

1. **Creates Symlinks** - Links configuration files from the repo to their proper locations:
   - `git/.gitconfig` → `~/.gitconfig`
   - `nvim/` → `~/.config/nvim`
   - `fish/` → `~/.config/fish`
   - `bat/` → `~/.config/bat`
   - `ghostty/` → `~/.config/ghostty`
   - `niri/` → `~/.config/niri` (Niri window manager)
   - `noctalia/` → `~/.config/noctalia` (Noctalia desktop shell)
   - And others...

2. **Installs Homebrew** - If not already installed (macOS only)
   - Uses the included `brew/Brewfile` for reproducible package installation

3. **Configures Shell** - Sets Fish as your default shell

4. **Installs Fish Plugins** - Runs `fisher update` to install plugins listed in `fish/fish_plugins`

### Arch Linux (CachyOS/Arch)

For Arch Linux systems, there's a separate package list in `arch/pkglist.txt`:

```bash
# Install all packages with paru
paru -S --needed --noconfirm - < arch/pkglist.txt

# Or with yay
yay -S --needed --noconfirm - < arch/pkglist.txt
```

The package list includes CLI tools, development tools, applications, and Arch-specific packages from the AUR.

### Troubleshooting

**Symlink conflicts:**
- If you have existing config files at the target locations, Dotbot will overwrite them (due to `force: true` in the config)
- Backup any existing configs before running `./install`

**Fish plugins don't load:**
- Manually run: `fish -c "fisher update"`

**Permission denied on install script:**
- Make executable: `chmod +x ~/.dotfiles/install`

**Homebrew installation fails:**
- Ensure Command Line Tools are installed: `xcode-select --install`

### Configuration Files

| Directory | Purpose |
|-----------|---------|
| `arch/` | Arch Linux package list (pkglist.txt) |
| `bat/` | Syntax highlighting configuration |
| `brew/` | Homebrew package list (Brewfile) |
| `fish/` | Fish shell configuration, functions, and plugins |
| `git/` | Git configuration with delta diff viewer |
| `ghostty/` | Terminal emulator configuration |
| `lazygit/` | LazyGit UI for git operations |
| `niri/` | Niri window manager configuration |
| `noctalia/` | Noctalia desktop shell configuration |
| `nvim/` | Neovim editor configuration |
| `opencode/` | OpenCode CLI configuration |

### Manual Installation (Without Dotbot)

If you prefer to set up manually:

```bash
# Clone the repo
git clone https://github.com/alinalihassan/dotfiles.git ~/.dotfiles

# Create symlinks manually
mkdir -p ~/.config
ln -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/git/.gitignore_global ~/.gitignore_global
ln -s ~/.dotfiles/nvim ~/.config/nvim
ln -s ~/.dotfiles/fish ~/.config/fish
ln -s ~/.dotfiles/bat ~/.config/bat
ln -s ~/.dotfiles/ghostty ~/.config/ghostty
ln -s ~/.dotfiles/lazygit ~/.config/lazygit
ln -s ~/.dotfiles/niri ~/.config/niri
ln -s ~/.dotfiles/noctalia ~/.config/noctalia

# Install packages (choose one)
# macOS:
brew bundle --file=~/.dotfiles/brew/Brewfile

# Arch Linux:
paru -S --needed --noconfirm - < ~/.dotfiles/arch/pkglist.txt

# Set Fish as default shell and install plugins
chsh -s $(which fish)
fish -c "fisher update"
```
