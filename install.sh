#! /bin/sh

if [ test -s $HOME/.gitconfig ]; then
    git config --global include.path "$PWD/.gitconfig"
else
    ln -s $PWD/.gitconfig  ~/.gitconfig
fi
