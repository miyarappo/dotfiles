#!/bin/bash

echo "start setup..."

# HomeBrewのインストール
if [ ! -x "`which brew`" ]; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew update
fi

# nodebrewのインストール
brew install nodebrew
$ echo 'export PATH=$HOME/.nodebrew/current/bin:$PATH' >> ~/.bash_profile

# nodeインストール
nodebrew install-binary v10.10.0
nodebrew use v10.10.0

# シンボリックを貼る
for f in .??*; do
    # ignore files
    [ "$f" = ".git" ] && continue
    [ "$f" = ".gitignore" ] && continue

    ln -snfv ~/dotfiles/"$f" ~/
done

echo "finish setup!"
