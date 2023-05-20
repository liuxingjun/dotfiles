#! /bin/sh

PWD=$(dirname "$(readlink -f "$0")")

for dot_file in "$PWD"/dot_*; do
    file_name=".${dot_file#*dot_}"
    if [ "$file_name" = ".gitconfig" ]; then
        git config --global include.path "$dot_file"
        continue
    fi
    home_file="$HOME/$file_name"
    if [ ! -e "$home_file" ]; then # 文件不存在
        ln -sv "$dot_file" "$home_file"
        continue
    fi
    real_file=$(readlink -f "$home_file")
    if [ "$real_file" = "$dot_file" ]; then # 文件已经软链到目标文件
        echo "skip file exists $home_file" 
        continue
    fi
    if [ "$real_file" = "$home_file" ]; then # 文件非软链 或者 不是软链到目标文件
        mv "$home_file" "$home_file.bak"
        ln -sv "$dot_file" "$home_file"
    fi
done
