#! /bin/sh

PWD=`dirname $0`
if [ -s $HOME/.gitconfig ]; then
    git config --global include.path "$PWD/.gitconfig"
else
    ln -s $PWD/.gitconfig  ~/.gitconfig
fi

echo "source $PWD/.alias"