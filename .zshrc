source "$HOME/.antigen/antigen.zsh"

antigen-use oh-my-zsh
#antigen-bundle git
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search
antigen-bundle arialdomartini/oh-my-git
antigen theme arialdomartini/oh-my-git-themes oppa-lana-style
antigen-bundle docker
antigen-apply

#PATH=~/.pyenv/shims:/usr/local/bin:/usr/local/sbin:$PATH
PATH=/usr/local/bin:/usr/local/sbin:$PATH
autoload -U colors && colors
VIRTUAL_ENV_DISABLE_PROMPT=true
function omg_prompt_callback() {
    if [ -n "${VIRTUAL_ENV}" ]; then
        echo "%F{white}(`basename ${VIRTUAL_ENV}`)%f "
    fi
}
#omg_second_line='%~ •'
omg_ungit_prompt="%~ • "

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

export EDITOR=e

# pip cache
export PIP_DOWNLOAD_CACHE="$HOME/.pipcache"
mkdir -p ${PIP_DOWNLOAD_CACHE}
export LANG=en_US.UTF-8


## Aliases
alias ..="cd ..;ll"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

# apps
alias g="git"
alias e="emacsclient -n "
alias ee="emacs"
alias estart="/Applications/Emacs.app/Contents/MacOS/Emacs --daemon"
alias estop="e -e '(kill-emacs)'"

alias p="python"


# python
alias act="source bin/activate"

# git
alias gg="git checkout"
alias feat="git checkout -b"
alias stage="git add"
alias undo="git checkout -- ."
alias h="git log --oneline"
alias d='git diff'

alias -g L="|less"


alias f="fg"
alias j="jobs"

alias fuck='sudo $(history -p \!\!)'

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
    clear &&  ls -l && echo && git branch && echo && git status --short --untracked-files=all --branch
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

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

export GOPATH=/Users/arialdomartini/prg/go
export PATH=$PATH:$GOPATH/bin
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home/
