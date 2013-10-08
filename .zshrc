source "$HOME/.antigen/antigen.zsh"

antigen-use oh-my-zsh
antigen-bundle git
antigen-bundle zsh-users/zsh-syntax-highlighting
antigen-bundle zsh-users/zsh-history-substring-search
antigen theme Granze/G-zsh-theme-2 granze2

antigen-apply

export EDITOR=emacs

# bind UP and DOWN arrow keys
zmodload zsh/terminfo
bindkey "$terminfo[kcuu1]" history-substring-search-up
bindkey "$terminfo[kcud1]" history-substring-search-down


## Aliases
alias ..="cd ..;ll"
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias g="git"
alias e="emacs"

alias -g L="|less"
# go home
alias h="cd ~"

# cd into a directory, then list it
alias c="cd $1;ll"

# Creates a directory, then cd into it
m() {
    mkdir -p $1
    cd $1
}

