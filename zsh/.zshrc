autoload -U compinit && compinit -u  # BEFORE zoxide init
eval "$(/usr/bin/zoxide init zsh)"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

#+BEGIN_SRC PowerLevel10k
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
#+END_SRC

if [ `tput colors` = "256" ]; then
	zinit light romkatv/powerlevel10k
fi
#+END_SRC

#+BEGIN_SRC Plugins
zinit light zsh-users/zsh-completions
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZP::fzf
zinit light Aloxaf/fzf-tab
#zinit light Tarrasch/zsh-bd
#zinit light https://github.com/felixr/docker-zsh-completion


HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=true
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

zinit light zsh-users/zsh-autosuggestions

# those should stay last
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma/fast-syntax-highlighting
zinit load wfxr/forgit


eval "$(direnv hook zsh)"

#+END_SRC

#+BEGIN_SRC Aliases
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"

alias tree='broot'

alias grep='rg'
alias find='fd'

alias ..="cd ..;l"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
#alias upto=bd

alias g="git"

# Emacs in a new frame
alias e="emacsclient -c --no-wait"
alias et="emacsclient -t"

# Emacs in the terminal
alias ee="emacsclient -ct"

alias estart="/Applications/Emacs.app/Contents/MacOS/Emacs --daemon"
alias estop="e -e '(kill-emacs)'"

alias p="python"

# git
alias h="git log --oneline"
alias -g L="|less"

alias f="fg"
alias j="jobs"

alias s="kitty +kitten ssh"

#eval "$(thefuck --alias)"

alias l="lsd -l"

alias ls="ls -p --color"

# cd into a directory, then list it
function c() {
    cd $1
    l
}

# Creates a directory, then cd into it
m() {
    mkdir -p $1
    cd $1
}

alias tree="nocorrect tree"

w() {
    clear &&  git branch && echo && git status --short --untracked-files=all --branch
}

dn() {
    git status --short --branch | grep '^.[M\?]' | head -1 | awk '{print $2}' | xargs git diff && w
    #git diff --name-only | head -1 | xargs git diff -- && w
}

an() {
    git status --short --branch | grep '^.[M\?]' | head -1 | awk '{print $2}' | xargs git add && w
    #git diff --name-only | head -1 | xargs git add && w
}

ramd() {
    local size_in_mb=$1
    local size=$(expr ${size_in_mb} \* 1024)
    local name="RamDisk"
    diskutil erasevolume HFS+ "$name" `hdiutil attach -nomount ram://$size`
    echo The ${size_in_mb} Mb ram disk $name is ready
}

dockerkillall() {
    docker stop $(docker ps -a -q)
    docker rm $(docker ps -a -q)
}

dockerremovestopped() {
    docker rm $(docker ps -qa --filter="status=exited")
}

denv() {
    eval "$(docker-machine env ${1:=default})"
}

denvs() {
    eval "$(docker-machine env --swarm $1)"
}

#+END_SRC

#+BEGIN_SRC  Environment variables

export HISTFILE=~/.zsh_history
export SAVEHIST=9999999
export HISTSIZE=9999999

export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export EDITOR=emacs
export VISUAL=emacs




export EDITOR=emacs
export GIT_EDITOR=emacs

export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'


export JAVA_HOME=/usr/lib/jvm/default

export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8


export HISTFILE=~/.zsh_history
export SAVEHIST=9999999
export HISTSIZE=9999999

export LS_COLORS="$(vivid generate solarized-dark)"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

export HASKELL_LSP_SERVER_ARGS="+RTS -M512m -RTS"

export DOTNET_CLI_TELEMETRY_OPTOUT=1

source /usr/share/doc/pkgfile/command-not-found.zsh

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line

# source /usr/share/zsh/plugins/zsh-nix-shell/nix-shell.plugin.zsh

eval "$(direnv hook zsh)"
