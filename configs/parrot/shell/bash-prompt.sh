# Custom bash prompt in the style of the fish prompt (config.fish)
# ╭─ user❯dir on  branch
# ╰─ 🦀 ❯

__prompt_style() {
    local gray="\[\e[0;90m\]"
    local blue="\[\e[1;38;5;39m\]"
    local pink="\[\e[38;5;205m\]"
    local red="\[\e[38;5;203m\]"
    local white="\[\e[1;37m\]"
    local reset="\[\e[0m\]"

    local dir="$PWD"
    if [[ "$dir" == "$HOME" ]]; then
        dir="~"
    else
        dir="${dir##*/}"
    fi

    local branch="$(git branch --show-current 2>/dev/null)"
    local git=""
    [[ -n "$branch" ]] && git="${gray} on ${pink} $branch"

    PS1="\n${gray}╭─ ${blue}\u${gray}❯${blue}$dir${git}\n${gray}╰─ ${red}🦀 ${white}❯ ${reset}"
}

PROMPT_COMMAND=__prompt_style
