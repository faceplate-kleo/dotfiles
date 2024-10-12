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
        #PROMPT_SYMBOL=󰒠
    fi
    echo $PROMPT_SYMBOL
}

# NAVMESH
LOGO_COLOR='yellow'
PATH_COLOR='blue'

# CYBERWAR
#LOGO_COLOR='green'
#PATH_COLOR='green'

PS1='%B%F{$LOGO_COLOR}%f%F{$PATH_COLOR} [%2~] %(1j.($(jobs -s | cut -d " " -f 6)) .)$(languageprompt) %f%b'

#[ -f "/home/kleo/.ghcup/env" ] && source "/home/kleo/.ghcup/env" # ghcup-env

path=(/home/kleo/.local/bin $path)
path=(/home/kleo/VM $path)
path=(/home/kleo/.cargo/bin $path)
path=(/home/kleo/go/bin $path)
path=("/home/kleo/jetbrains/GoLand-2024.1.2/bin" $path)
path=("/home/kleo/jetbrains/IntelliJ-IU/bin" $path)
path=("/home/kleo/jetbrains/RubyMine/bin" $path)
path=("/home/kleo/jetbrains/CLion/bin" $path)
path=("/home/kleo/jetbrains/WebStorm/bin" $path)
path=("/home/kleo/jetbrains/PyCharm/bin" $path)
path=("/home/kleo/Dev/flutter/bin" $path)
export PATH

export NVIM_CONFIG=/home/kleo/.config/nvim
export I3_CONFIG=/home/kleo/.config/i3/config
export I3_COMMON_CONFIG=/home/kleo/.config/i3/common-config.i3
export POLYBAR_CONFIG=/home/kleo/.config/polybar/config.ini
export GPG_TTY=$(tty)
export TERM_PROGRAM="alacritty"
export TERM_PROGRAM_VERSION=$(alacritty --version | awk '{ print $2 }')
export CHROME_EXECUTABLE="/snap/bin/chromium"

source ~/.aliases
source ~/.completions

if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [[ ! "$TERM" = linux ]] && [ -z "$TMUX" ] && [ -z "$INSIDE_IDE" ]; then
  exec tmux
fi

export JAVA_HOME=$(readlink -nf $(which java) | xargs dirname | xargs dirname)

set -o vi

[ -f "/home/kleo/.ghcup/env" ] && source "/home/kleo/.ghcup/env" # ghcup-env

eval "$(starship init zsh)"
