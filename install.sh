#!/bin/sh

function install() {
    cp .zshrc ~/.zshrc
    cp .emacs ~/.emacs
    cp .gitconfig ~/.gitconfig
    cp .gitignore-global ~/.gitignore-global
}

echo "Your current .zshrc, .emacs, .gitconfig and .gitignore-global will be overwritten"
read -p "Are you sure (y/n)? " reply

if [[ $reply = "y" ]];
then
    $(install)
fi
