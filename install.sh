#!/bin/bash

declare -a files=(".zshrc" ".gitconfig" ".gitignore-global" "gradle.properties" ".tmux.conf" ".config/i3/config" ".tigrc")

PWD=`pwd -P`

function install() {
    for i in "${files[@]}"
    do
        ln -fs $PWD/$i ~/$i
    done

    mkdir -p ~/.emacs.d
    ln -fs $PWD/.emacs.d/init.el ~/.emacs.d/init.el
}

$(install)

