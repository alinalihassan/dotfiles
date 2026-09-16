# Dotfiles

This repository contains my personal configuration files (dotfiles) for macOS.

[DotBash](https://github.com/alinalihassan/dotbash) generates a self-contained `install.sh` from `dotbash.yaml`. Commit both: edit the YAML, regenerate the script, and new machines only need `./install.sh`.

## Installation

### Prerequisites

- macOS 12 or later
- Git
- Command Line Tools: `xcode-select --install`

### Quick Start

```bash
git clone https://github.com/alinalihassan/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

That creates symlinks, installs Homebrew packages from `brew/Brewfile`, sets Fish as the default shell, installs Fisher plugins, and generates Fish completions for tools that are present (`docker`, `kubectl`, `gh`, `supabase`, `orbctl`, `bun`).

### Regenerating `install.sh`

After changing `dotbash.yaml`:

```bash
bunx dotbash
```

Commit the updated `install.sh` together with the YAML.

### Troubleshooting

**Symlink conflicts:**
- Existing files at target paths are replaced (`force: true`)
- Backup anything you care about before running `./install.sh`

**Fish plugins don't load:**
- `fish -c "fisher update"`

**Permission denied on install script:**
- `chmod +x ~/.dotfiles/install.sh`

**Homebrew installation fails:**
- `xcode-select --install`

### Configuration Files

| Directory | Purpose |
|-----------|---------|
| `bat/` | Syntax highlighting configuration |
| `brew/` | Homebrew package list (Brewfile) |
| `fish/` | Fish shell configuration (plugins and completions are installed, not committed) |
| `git/` | Git configuration with delta |
| `ghostty/` | Terminal emulator configuration |
| `lazygit/` | LazyGit UI for git operations |
| `nvim/` | Neovim editor configuration |
| `opencode/` | OpenCode CLI configuration |
