#!/bin/bash

declare -a files=(".zshrc" ".gitconfig" ".gitignore-global" "gradle.properties" ".tmux.conf" ".config/i3/config" ".config/alacritty/alacritty.yml" ".config/i3status/config"  ".tigrc")

PWD=`pwd -P`

function install() {
    for i in "${files[@]}"
    do
        ln -fs $PWD/$i ~/$i
    done

    mkdir -p ~/.config/emacs
    mkdir ~/.saves
    ln -fs $PWD/.config/emacs/init.el ~/.config/emacs/init.el

    mkdir -p ~/.screenlayout/
    ln -fs $PWD/.screenlayout/dual-screen.sh ~/.screenlayout
}

$(install)

