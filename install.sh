#!/bin/bash

declare -a files=(".zshrc" ".gitconfig" ".gitignore-global" "gradle.properties" ".tmux.conf" ".config/i3/config" ".config/alacritty/alacritty.yml" ".config/i3status/config"  ".tigrc")

PWD=`pwd -P`

function install() {
    for i in "${files[@]}"
    do
        ln -fs $PWD/$i ~/$i
    done

    # Emacs
    mkdir -p ~/.saves
    mkdir -p ~/.config/emacs
    customPackages=.config/emacs/my-packages
    mkdir -p ~/${customPackages}

    for i in $(ls ${PWD}/${customPackages})
    do
        ln -fs $PWD/${customPackages}/$i ~/${customPackages}/$i
    done
    
    ln -fs $PWD/.config/emacs/init.el ~/.config/emacs/init.el

    # i3
    mkdir -p ~/.screenlayout/
    ln -fs $PWD/.screenlayout/dual-screen.sh ~/.screenlayout
}

$(install)

