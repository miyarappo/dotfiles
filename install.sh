#!/bin/bash

echo "start setup..."

for f in .??*; do
    # ignore files
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitignore" ] && continue

    ln -snfv ~/dotfiles/"$f" ~/
done

echo "finish setup!"
