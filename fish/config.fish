# Configure Jump

# Jump - lazy loaded on first prompt for faster startup
function __jump_init --on-event fish_prompt
    functions --erase __jump_init  # Remove this function after first run
    source (jump shell fish | psub)
end

## Zoxide cd replacement
zoxide init --cmd cd fish | source

# Configure fzf.fish keybindings (Ctrl+F then letter)
# \cf = Ctrl+F, then the letter follows
fzf_configure_bindings --directory=\cff --history=\cfh --git_status=\cfs --git_log=\cfl --processes=\cfp --variables=\cfv

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init2.fish 2>/dev/null || :
