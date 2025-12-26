function ls --wraps="eza --icons --ignore-glob='.DS_Store'" --description "alias ls eza --icons --ignore-glob='.DS_Store'"
    eza --icons --ignore-glob='.DS_Store' $argv
end
