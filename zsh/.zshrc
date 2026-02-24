autoload -U compinit && compinit -u  # BEFORE zoxide init
eval "$(/usr/bin/zoxide init zsh)"

# Load zplug
source ~/.zplug/init.zsh

# PowerLevel10k setup
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ `tput colors` = "256" ]; then
    zplug "romkatv/powerlevel10k", as:theme, depth:1
fi

# Plugins
zplug "zsh-users/zsh-completions"
zplug "ohmyzsh/ohmyzsh", use:"lib/history.zsh"
zplug "ohmyzsh/ohmyzsh", use:"plugins/git/git.plugin.zsh"
zplug "ohmyzsh/ohmyzsh", use:"plugins/fzf/fzf.plugin.zsh"
zplug "Aloxaf/fzf-tab"
zplug "Tarrasch/zsh-bd"

# History substring search
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=true
zplug "zsh-users/zsh-history-substring-search"
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# These should stay last
zplug "zsh-users/zsh-autosuggestions"
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "wfxr/forgit"

eval "$(direnv hook zsh)"

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

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
alias j="clear && jj st && echo && jj l --limit 20"

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

yss() {
  yay -Ss "$@" 2>/dev/null | awk '/^[a-z]/{name=$1} /^    /{gsub(/^    /,"",$0); printf "%-30s %s\n", name, $0}'
}

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

# Environment variables
export HISTFILE=~/.zsh_history
export SAVEHIST=9999999
export HISTSIZE=9999999

export HISTORY_IGNORE="(ls|cd|pwd|exit|sudo reboot|history|cd -|cd ..)"
export EDITOR=emacs
export VISUAL=emacs

export PAGER=less

export EDITOR=emacs
export GIT_EDITOR=emacs

export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init'

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


# Expands history expressions like !! or !$ when you press space
bindkey ' ' magic-space
