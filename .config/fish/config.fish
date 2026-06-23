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

fnm env | source
set -gx ANTHROPIC_BASE_URL http://localhost:11434
set -gx ANTHROPIC_API_KEY ollama
set -gx ANTHROPIC_MODEL gemma4:e4b

fish_add_path -a "$HOME/.foundry/bin"
fish_add_path "$HOME/.kilo/bin"

# Package manager aliases
alias i="sudo dnf install"
alias u="sudo dnf update"
alias s="dnf search"
alias sy="dnf search"
alias yi="sudo dnf install"
alias yu="sudo dnf update"
alias c="clear"
