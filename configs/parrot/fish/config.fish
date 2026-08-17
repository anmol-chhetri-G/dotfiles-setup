set -g fish_greeting ""
set -g VIRTUAL_ENV_DISABLE_PROMPT 1

function fish_prompt
    echo

    set_color 666
    echo -n "╭─ "

    set_color -o 00afff
    echo -n "$USER"

    set_color 666
    echo -n "❯"

    set_color -o 00afff
    echo -n (prompt_pwd -d 0)

    set -l git_branch (git branch --show-current 2>/dev/null)
    if test -n "$git_branch"
        set_color 666
        echo -n " on "
        set_color ff00af
        echo -n " $git_branch"
    end
    echo ""

    set_color 666
    echo -n "╰─ "

    set_color f05340
    echo -n "🦀 "

    set_color -o fff
    echo -n "❯ "

    set_color normal
end

function fish_right_prompt
    if set -q VIRTUAL_ENV
        set_color f05340
        echo -n "(" (basename "$VIRTUAL_ENV") ")"
    end
    set_color normal
end

set fish_color_command ced4de
set fish_color_param 00afff
set fish_color_quote ffff00
set fish_color_error ff0000
set fish_color_autosuggestion 555

fish_add_path -a "$HOME/.foundry/bin"
fish_add_path "$HOME/.kilo/bin"
fish_add_path "$HOME/.local/bin"

# Parrot / Debian package manager aliases
alias i="sudo apt install"
alias u="sudo apt update && sudo apt full-upgrade"
alias s="apt search"
alias c="clear"
