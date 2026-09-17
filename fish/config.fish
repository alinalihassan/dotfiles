set -g fish_greeting
set -gx EDITOR nvim
set -gx HOMEBREW_NO_ANALYTICS 1

if test -d /opt/homebrew/bin
    fish_add_path /opt/homebrew/bin
end
if test -d /usr/local/bin
    fish_add_path /usr/local/bin
end
if test -d $HOME/.bun/bin
    fish_add_path $HOME/.bun/bin
end
if test -d $HOME/.local/bin
    fish_add_path $HOME/.local/bin
end
if test -d $HOME/.orbstack/bin
    fish_add_path $HOME/.orbstack/bin
end
if test -d $HOME/.opencode/bin
    fish_add_path $HOME/.opencode/bin
end

if status is-interactive
    command -q zoxide; and zoxide init --cmd cd fish | source

    if functions -q fzf_configure_bindings
        fzf_configure_bindings --directory=\cff --history=\cfh --git_status=\cfs --git_log=\cfl --processes=\cfp --variables=\cfv
    end

    set -l theme_file $__fish_config_dir/themes/"TokyoNight Night.theme"
    if test -f $theme_file
        fish_config theme choose "TokyoNight Night"
    end
end
