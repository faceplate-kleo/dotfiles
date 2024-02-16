setopt PROMPT_SUBST
languageprompt () {
    if [[ $PWD =~ ".github" ]]
    then
        PROMPT_SYMBOL=
    elif [[ $PWD =~ "haskell" ]] || [[ $(ls | grep "\.hs") ]]
    then
        PROMPT_SYMBOL=󰲒
    elif [[ $PWD =~ "rust" ]] || [[ $(ls | grep "\.rs") ]] || [[ -f "$PWD/Cargo.toml" ]]
    then
        PROMPT_SYMBOL=󱘗
    elif [[ $PWD =~ "ruby" ]] || [[ $(ls | grep "\.rb") ]]
    then
        PROMPT_SYMBOL=
    elif [[ $PWD =~ "go" ]] || [[ $(ls | grep "\.go") ]] || [[ -f "$PWD/go.mod" ]]
    then
        PROMPT_SYMBOL=󰟓
    elif [[ $PWD =~ "lua" ]] || [[ $(ls | grep "\.lua") ]]
    then
        PROMPT_SYMBOL=󰢱
    else
        PROMPT_SYMBOL=Σ
    fi
    echo $PROMPT_SYMBOL
}

PS1='%B%F{magenta}Λ [%2~] %(1j.($(jobs -s | cut -d " " -f 6)) .)$(languageprompt) %f%b'

#[ -f "/home/kleo/.ghcup/env" ] && source "/home/kleo/.ghcup/env" # ghcup-env

path=(/home/kleo/.local/bin $path)
export PATH

export NVIM_CONFIG=/home/kleo/.config/nvim
export I3_CONFIG=/home/kleo/.config/i3/config

alias ls='ls -G'
alias ll='ls -l -G'
alias celar='clear'
alias cls='clear'
alias clera='clear'
alias vim='nvim'
alias nvimconfig='nvim $NVIM_CONFIG/init.vim'
alias i3config='nvim $I3_CONFIG'
alias zrc='nvim ~/.zshrc'
alias szrc='source ~/.zshrc'
alias install='sudo pacman -S'
alias pacsearch='sudo pacman -Ss'
alias purgeswaps='rm ~/.local/state/nvim/swap/*.swp'
alias again='fc -s'
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [[ ! "$TERM" = linux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

[ -f "/home/kleo/.ghcup/env" ] && source "/home/kleo/.ghcup/env" # ghcup-env
