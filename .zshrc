source "$HOME/.antigen/antigen.zsh"

PATH="/usr/local/bin:$PATH"

antigen-use oh-my-zsh
antigen-bundle git
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search
#antigen theme Granze/G-zsh-theme-2 granze2
antigen-bundle code4nothing/oh-my-git
antigen theme arialdomartini/oh-my-git-themes arialdo-granzestyle
#antigen-bundle code4nothing/oh-my-git
antigen theme code4nothing/oh-my-git-themes arialdo-granzestyle
antigen theme arialdomartini/oh-my-git-themes arialdo-pathinline

antigen-apply

export EDITOR=emacs

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down

# pip cache
export PIP_DOWNLOAD_CACHE="$HOME/.pipcache"
mkdir -p ${PIP_DOWNLOAD_CACHE}
export LANG=en_US.UTF-8


## Aliases
alias ..="cd ..;ll"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias g="git"
alias e="emacs"
alias p="python"

alias act="source bin/activate"
alias go="git checkout"
w() {
    clear
    ls -l
    echo
    git branch
    echo
    git st
}


alias -g L="|less"
# go home
alias h="cd ~"

alias f="fg"
alias j="jobs"

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


PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
