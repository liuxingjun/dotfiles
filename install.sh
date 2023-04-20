#! /bin/sh

PWD=$(dirname "$(readlink -f "$0")")

for dot_file in "$PWD"/dot_*; do
    home_file=~/.${dot_file#*dot_}
    if [ -e "$home_file" ]; then
        real_file=$(readlink -f "$home_file")
        if [ "$real_file" = "$home_file" ]; then
            mv "$home_file" "$home_file.bak"
        elif [ "$real_file" = "$dot_file" ]; then
            rm "$home_file"
        fi
    fi
    ln -sv $dot_file $home_file
done
