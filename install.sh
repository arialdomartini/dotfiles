#!/bin/bash

declare -a files=(".zshrc" ".gitconfig" ".gitignore-global" "gradle.properties" ".tmux.conf" ".config/i3/config" ".config/alacritty/alacritty.yml" ".config/i3status/config"  ".tigrc")

PWD=`pwd -P`

function install() {
    for i in "${files[@]}"
    do
        ln -fs $PWD/$i ~/$i
    done

    mkdir -p ~/.doom.d
    ln -fs $PWD/.doom.d/config.el ~/.doom.d/config.el
    ln -fs $PWD/.doom.d/custom.el ~/.doom.d/custom.el
    ln -fs $PWD/.doom.d/init.el ~/.doom.d/init.el
    ln -fs $PWD/.doom.d/packages.el ~/.doom.d/packages.el

    mkdir -p ~/.screenlayout/
    ln -fs $PWD/.screenlayout/dual-screen.sh ~/.screenlayout
}

$(install)

