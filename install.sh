#!/bin/bash

declare -a files=(".zshrc"  ".emacs"  ".spacemacs"  ".gitconfig"  ".gitignore-global"  "gradle.properties"  ".tmux.conf"  ".config/i3/config" ".tigrc")

function install() {
    for i in "${files[@]}"
    do
        ln -fs `pwd -P`/$i ~/$i
    done

    ln -fs `pwd -P`/karabiner.json ~/.config/karabiner/karabiner.json
}

echo "Files that will be overwritten:"
for i in "${files[@]}"
do
    echo "./$i => $HOME/$i"
done

echo "./karabiner.json => ~/.config/karabiner.json"

read -p "Are you sure (y/n)? " reply

if [[ $reply = "y" ]];
then
    $(install)
fi
