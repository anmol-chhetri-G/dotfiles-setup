export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"

plugins=(git)

source $ZSH/oh-my-zsh.sh

# Custom prompt in the style of the fish prompt
# ╭─ user❯dir on  branch
# ╰─ 🦀 ❯
setopt prompt_subst

precmd() {
    local branch="$(git branch --show-current 2>/dev/null)"
    local git=""
    [[ -n "$branch" ]] && git="%F{8} on %F{205} $branch%f"
    local dir="$PWD"
    [[ "$dir" == "$HOME" ]] && dir="~" || dir="${dir:t}"
    PROMPT=$'\n'"%F{8}╭─ %B%F{39}%n%f%b%F{8}❯%f%B%F{39}$dir%f%b${git}"$'\n'"%F{8}╰─ %F{203}🦀 %f%B%F{15}❯ %f%b"
}

# Parrot / Debian package manager aliases
alias i="sudo apt install"
alias u="sudo apt update && sudo apt full-upgrade"
alias s="apt search"
alias c="clear"

alias pyenv="source ~/pyenv/myenv/bin/activate"
export PATH="$HOME/.local/bin:$PATH"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

# Programs also available in bash (opencode, cargo, ...)
export PATH="$HOME/.opencode/bin:$PATH"
export PATH="$HOME/go/bin:$PATH"
[ -s "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"


# Generated for pdtm. Do not edit.
export PATH=$PATH:/home/anmol/.pdtm/go/bin

