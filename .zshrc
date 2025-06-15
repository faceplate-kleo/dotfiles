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

setopt autocd
source <(fzf --zsh)
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

export MANPAGER="nvim -u ~/.config/nvim/manpager.vim +Man!"

# Catppuccin Macchiato for FZF Previewing
# https://github.com/catppuccin/fzf/blob/main/themes/catppuccin-fzf-macchiato.sh
#export FZF_DEFAULT_OPTS=" \
#--color=bg+:#363A4F,bg:#24273A,spinner:#F4DBD6,hl:#ED8796 \
#--color=fg:#CAD3F5,header:#ED8796,info:#C6A0F6,pointer:#F4DBD6 \
#--color=marker:#B7BDF8,fg+:#CAD3F5,prompt:#C6A0F6,hl+:#ED8796 \
#--color=selected-bg:#494D64 \
#--color=border:#363A4F,label:#CAD3F5"

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
path=(/usr/local/go/bin $path)
path=("/home/kleo/jetbrains/GoLand-2024.1.2/bin" $path)
path=("/home/kleo/jetbrains/IntelliJ-IU/bin" $path)
path=("/home/kleo/jetbrains/RubyMine/bin" $path)
path=("/home/kleo/jetbrains/CLion/bin" $path)
path=("/home/kleo/jetbrains/WebStorm/bin" $path)
path=("/home/kleo/jetbrains/PyCharm/bin" $path)
path=("/home/kleo/Dev/flutter/bin" $path)
path=("/home/kleo/scripts" $path)
export PATH

export NVIM_CONFIG=/home/kleo/.config/nvim
export I3_CONFIG=/home/kleo/.config/i3/config
export I3_COMMON_CONFIG=/home/kleo/.config/i3/common-config.i3
export POLYBAR_CONFIG=/home/kleo/.config/polybar/config.ini
export KITTY_CONFIG=/home/kleo/.config/kitty/kitty.conf
export GPG_TTY=$(tty)
#export TERM_PROGRAM="alacritty"
#export TERM_PROGRAM_VERSION=$(alacritty --version | awk '{ print $2 }')
export CHROME_EXECUTABLE="/snap/bin/chromium"

autoload -U +X compinit && compinit
autoload -U colors && colors
source ~/.aliases
source ~/.completions
source ~/.cargo/env

#if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [[ ! "$TERM" = linux ]] && [ -z "$TMUX" ] && [ -z "$INSIDE_IDE" ]; then
#  exec tmux
#fi

#export JAVA_HOME=$(readlink -nf $(which java) | xargs dirname | xargs dirname)

set -o vi

[ -f "/home/kleo/.ghcup/env" ] && source "/home/kleo/.ghcup/env" # ghcup-env

eval "$(starship init zsh)"
eval "$(starship completions zsh)"
eval "$(kind completion zsh)"
alias gimme='. gimme.zsh'

DISABLE_AUTO_TITLE="true"

# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
# Not supported in the "fish" shell.
(cat ~/.cache/wal/sequences &)

# Alternative (blocks terminal for 0-3ms)
cat ~/.cache/wal/sequences

# To add support for TTYs this line can be optionally added.
source ~/.cache/wal/colors-tty.sh
