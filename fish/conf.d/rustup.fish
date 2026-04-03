# Official rustup (~/.cargo/bin). Prepend if missing so cargo/rustc are not from Homebrew.
if test -d $HOME/.cargo/bin
    contains $HOME/.cargo/bin $PATH
    or set -gx PATH $HOME/.cargo/bin $PATH
end
