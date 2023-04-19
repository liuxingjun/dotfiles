#! /bin/sh

PWD=$(dirname $(readlink -f "$0"))

for file in $PWD/dot_*; do
    ln -sfv $file ~/.${file#*dot_}
done
