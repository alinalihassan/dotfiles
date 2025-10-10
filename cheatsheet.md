# Cheatsheets

## Global (MacOS)

| Action | Shortcut |
|--------|----------|
| Open Spotlight | ⌘ + Space |

## Third Party Apps

### [rcmd](https://lowtechguys.com/rcmd/)

| Action | Shortcut |
|--------|----------|
| Open app that starts with letter | RightCmd + Letter |

### [Magnet](https://magnet.crowdcafe.com/)

| Action | Shortcut |
|--------|----------|
| Snap window to half of the screen | Ctrl + Opt + ←↑→↓ |
| Maximize window | Ctrl + Opt + Enter |
| Center window | Ctrl + Opt + C |

### [1Password](https://1password.com/)

| Action | Shortcut |
|--------|----------|
| Open 1Password Quickview | Opt + Space |

## Ghostty/Wezterm

All keybindings are found in Ghostty's [config](ghostty/config)

### Tab Management

| Action | Shortcut |
|--------|----------|
| New Tab | ⌘ + t |
| Cycle Next Tabs | Ctrl + Tab |
| Cycle Previous Tabs | Ctrl + Shift + Tab |
| Open (Number) Tab | ⌘ + Number |

### Splits

| Action | Shortcut |
|--------|----------|
| New Horizontal Split | ⌘ + \ |
| New Vertical Split | ⌘ + - |
| Move to split | ⌘ + hjkl |
| Move to split | ⌘ + ←↑→↓ |
| Resize Split in Direction | ⌘ + Shift + hjkl |
| Resize Split in Direction | ⌘ + Shift + ←↑→↓ |

### Other

| Action | Shortcut |
|--------|----------|
| Clear screen | Ctrl + l |
| Reload Ghosty Config | ⌘ + r |
| Close Tab/Surface | ⌘ + w |

## Shell

### Fuzzy find for Fish ([fzf-fish](https://github.com/PatrickF1/fzf.fish))

| Action | Shortcut |
|--------|----------|
| Search directory | Ctrl + Opt + f |
| Search history | Ctrl + r |
| Search Git log | Ctrl + Opt + l |
| Search Git status | Ctrl + Opt + s |
| Search processes | Ctrl + Opt + p |
| Search variables | Ctrl + v |

## NeoVim

### Basic Navigation

| Action | Shortcut |
|--------|----------|
| Move left, down, up, right | `h`, `j`, `k`, `l` |
| Move to next/previous word | `w`, `b` |
| Move to next/previous WORD (space-separated) | `W`, `B` |
| Beginning of line, first non-blank, end of line | `0`, `^`, `$` |
| Go to first/last line | `gg`, `G` |
| Go to line number | `{number}G` |
| Move up/down half page | `Ctrl-u`, `Ctrl-d` |
| Move up/down full page | `Ctrl-b`, `Ctrl-f` |
| Center/top/bottom current line | `zz`, `zt`, `zb` |

### Window Navigation

| Action | Shortcut |
|--------|----------|
| Move between windows | `Ctrl-h`, `Ctrl-j`, `Ctrl-k`, `Ctrl-l` |
| Move between windows (alternative) | `Ctrl-w` + `h/j/k/l` |
| Cycle through windows | `Ctrl-w` + `w` |
| Vertical split | `Ctrl-w` + `v` |
| Horizontal split | `Ctrl-w` + `s` |
| Close current window | `Ctrl-w` + `q` |
| Equalize window sizes | `Ctrl-w` + `=` |

### Basic Editing

| Action | Shortcut |
|--------|----------|
| Insert before/after cursor | `i`, `a` |
| Insert at beginning/end of line | `I`, `A` |
| New line below/above | `o`, `O` |
| Replace character/overwrite mode | `r`, `R` |
| Delete character under/before cursor | `x`, `X` |
| Delete line/from cursor to end of line | `dd`, `D` |
| Yank (copy) line | `yy`, `Y` |
| Paste after/before cursor | `p`, `P` |
| Undo/Redo | `u`, `Ctrl-r` |
| Repeat last command | `.` |

### Text Objects (mini.ai)

| Action | Shortcut |
|--------|----------|
| Visually select around parentheses, brackets, braces, quotes | `va)`, `va]`, `va}`, `va'`, `va"` |
| Visually select inside parentheses, brackets, braces, quotes | `vi)`, `vi]`, `vi}`, `vi'`, `vi"` |
| Yank inside next quote | `yinq` |
| Change inside single quotes | `ci'` |
| Delete around parentheses | `da)` |
| Delete inside double quotes | `di"` |

### Surround (mini.surround)

| Action | Shortcut |
|--------|----------|
| Surround add (e.g., adds parentheses around word) | `sa` + `motion` + `char` |
| Surround delete (e.g., removes single quotes) | `sd` + `char` |
| Surround replace (e.g., changes `)` to `'`) | `sr` + `old` + `new` |
| Surround add inner word with parentheses | `saiw)` |
| Surround add inner word with brackets | `saiw[` |
| Surround add inner word with braces | `saiw{` |
| Surround add inner word with single quotes | `saiw'` |
| Surround add inner word with double quotes | `saiw"` |

### Comments

| Action | Shortcut |
|--------|----------|
| Toggle comment on current line | `gcc` |
| Toggle comment on motion (e.g., comments 3 lines down) | `gc` + `motion` |
| Toggle comment on selection | `gc` + `visual selection` |

### Leader Key Mappings (Space)

| Action | Shortcut |
|--------|----------|
| Write file | `<leader>w` |
| Quit Neovim | `<leader>q` |
| Open Lazy (plugin manager) | `<leader>pl` |
| Open Mason (LSP installer) | `<leader>pm` |
| Toggle current line git blame | `<leader>tg` |

### Search & Find (Telescope)

| Action | Shortcut |
|--------|----------|
| Search help tags | `<leader>sh` |
| Search keymaps | `<leader>sk` |
| Search files | `<leader>sf` |
| Search select telescope | `<leader>ss` |
| Search text (live grep) | `<leader>st` |
| Search current word | `<leader>sw` |
| Search diagnostics | `<leader>sd` |
| Search resume | `<leader>sr` |
| Search recent files | `<leader>s.` |
| Find existing buffers | `<leader><leader>` |
| Fuzzy search in current buffer | `<leader>/` |
| Search in open files | `<leader>s/` |
| Search Neovim config files | `<leader>sn` |

### Git (Gitsigns + LazyGit)

| Action | Shortcut |
|--------|----------|
| Open LazyGit | `<leader>gg` |
| Show git blame | `<leader>gb` |
| Toggle current line git blame | `<leader>tg` |

### LSP (Language Server Protocol)

| Action | Shortcut |
|--------|----------|
| Rename symbol | `grn` |
| Code action | `gra` |
| Find references | `grr` |
| Go to implementation | `gri` |
| Go to definition | `grd` |
| Go to declaration | `grD` |
| Open document symbols | `gO` |
| Open workspace symbols | `gW` |
| Go to type definition | `grt` |
| Toggle inlay hints | `<leader>th` |
| Show documentation (hover) | `<C-Space>` |

### Session Management (Persistence)

| Action | Shortcut |
|--------|----------|
| Restore session | `<leader>mr` |
| Select session | `<leader>ms` |
| Restore last session | `<leader>ml` |
| Don't save current session | `<leader>md` |


## Obsidian

TODO

## Excalidraw

TODO
