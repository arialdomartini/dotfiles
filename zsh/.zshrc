autoload -U compinit && compinit -u  # BEFORE zoxide init
eval "$(/usr/bin/zoxide init zsh)"

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

eval "$(starship init zsh)"

zinit light zsh-users/zsh-completions
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::plugins/git/git.plugin.zsh
zinit snippet OMZP::fzf
zinit light Aloxaf/fzf-tab
zinit light Tarrasch/zsh-bd

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=true
zinit light zsh-users/zsh-history-substring-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# these should stay last
zinit light zsh-users/zsh-autosuggestions
zinit light zdharma-continuum/fast-syntax-highlighting
zinit load wfxr/forgit

eval "$(direnv hook zsh)"

# Aliases
alias reload=". ~/.zshrc && echo 'ZSH config reloaded from ~/.zshrc'"
alias tree='broot'
alias grep='rg'
alias find='fd'
alias ..="cd ..;l"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias upto=bd
alias g="git"
alias e="emacsclient -c --no-wait"
alias et="emacsclient -t"
alias ee="emacsclient -ct"
alias estart="/Applications/Emacs.app/Contents/MacOS/Emacs --daemon"
alias estop="e -e '(kill-emacs)'"
alias p="python"
alias h="git log --oneline"
alias -g L="|less"
alias f="fg"
alias j="clear && jj st && echo && jj l"
alias s="kitty +kitten ssh"
alias l="lsd -l"
alias ls="ls -p --color"
alias tree="nocorrect tree"

function c() { cd $1; l }
m() { mkdir -p $1; cd $1 }

yss() {
  yay -Ss "$@" 2>/dev/null | awk '/^[a-z]/{name=$1} /^    /{gsub(/^    /,"",$0); printf "%-30s %s\n", name, $0}'
}

w() {
    clear && git branch && echo && git status --short --untracked-files=all --branch
}

dn() {
    git status --short --branch | grep '^.[M\?]' | head -1 | awk '{print $2}' | xargs git diff && w
}

an() {
    git status --short --branch | grep '^.[M\?]' | head -1 | awk '{print $2}' | xargs git add && w
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

denv() { eval "$(docker-machine env ${1:=default})" }
denvs() { eval "$(docker-machine env --swarm $1)" }

# Environment variables
export HISTFILE=~/.zsh_history
export SAVEHIST=9999999
export HISTSIZE=9999999
export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export EDITOR=emacs
export VISUAL=emacs
export PAGER=less
export GIT_EDITOR=emacs
export SYSTEMD_EDITOR=emacs
export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init'
export JAVA_HOME=/usr/lib/jvm/default
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LS_COLORS="$(vivid generate solarized-dark)"
export WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'
export HASKELL_LSP_SERVER_ARGS="+RTS -M512m -RTS"
export DOTNET_CLI_TELEMETRY_OPTOUT=1

autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

source /usr/share/doc/pkgfile/command-not-found.zsh

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
bindkey "\e[H" beginning-of-line
bindkey "\e[F" end-of-line
bindkey ' ' magic-space
