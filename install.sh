#!/bin/bash

declare -a files=(".zshrc" ".gitconfig" ".gitignore-global" "gradle.properties" ".tmux.conf" ".config/i3/config" ".tigrc" ".emacs.d")

function install() {
    for i in "${files[@]}"
    do
        ln -fs `pwd -P`/$i ~/$i
    done
}

read -p "Are you sure (y/n)? " reply

if [[ $reply = "y" ]];
then
    $(install)
fi
