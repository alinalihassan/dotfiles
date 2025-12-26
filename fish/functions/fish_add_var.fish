function fish_add_var --description "Add a universal environment variable"
    if test (count $argv) -lt 2
        echo "Usage: fish_add_var VARIABLE VALUE"
        return 1
    end
    set -Ux $argv[1] $argv[2]
end
