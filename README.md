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
git clone --recurse-submodules https://github.com/alinalihassan/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

`--recurse-submodules` pulls the private [`mackup-store`](https://github.com/alinalihassan/mackup-store) (GUI prefs). Skip it if you don't have access; public install still works.

That creates symlinks, installs Homebrew packages from `brew/Brewfile`, sets Fish as the default shell, installs Fisher plugins, and generates Fish completions for tools that are present (`docker`, `kubectl`, `gh`, `supabase`, `orbctl`, `bun`).

### Regenerating `install.sh`

After changing `dotbash.yaml`, regenerate with **DotBash ≥ 0.2.0** (`--dry-run`, `--check`, real `optional` steps).

`bunx dotbash` still resolves to npm **0.1.1** and will clobber `install.sh` with the old generator. Until `0.2.0` is on npm:

```bash
git clone https://github.com/alinalihassan/dotbash.git /tmp/dotbash
cd /tmp/dotbash && bun install && bun run build
bun /tmp/dotbash/build/cli.js
bun /tmp/dotbash/build/cli.js --check
```

Publish once from the DotBash repo (`npm login && npm publish`), then `bunx dotbash` is fine again.

Commit the updated `install.sh` together with the YAML.

Preview what the installer would do without making changes:

```bash
./install.sh --dry-run
```

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
| `mackup/` | Mackup config + GUI app prefs (macOS) |
| `nvim/` | Neovim editor configuration |
| `opencode/` | OpenCode CLI configuration |

### Mackup (macOS GUI settings)

DotBash/Dotbot manage text configs (fish, nvim, git, ghostty, …). Mackup covers **GUI / plist prefs**. Backups live in the private submodule [`mackup/store`](https://github.com/alinalihassan/mackup-store).

```bash
# First-time / new Mac (needs access to the private store repo)
git submodule update --init mackup/store

# After install (links ~/.mackup.cfg + ~/.mackup)
mackup backup                 # write prefs into mackup/store/
(cd mackup/store && git add -A && git commit -m "Update prefs" && git push)

mackup restore                # on a new Mac, after brew bundle
```

Use **copy mode only** (`backup` / `restore`). Do not use `mackup link` on Sonoma+. Sandboxed App Store apps may need Full Disk Access for Terminal.
