#!/bin/sh

function install() {
    cp .zshrc ~/.zshrc
}

echo "Your current .zshrc will be overwritten"
read -p "Are you sure (y/n)? " -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    $(install)
fi
