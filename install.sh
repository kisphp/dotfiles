#!/bin/bash

GIT=`which git`
DIR='.dotfiles'

if [[ ! -z "$ZSH" ]];then
    ZSH_FILE='~/.zshrc'
else
    ZSH_FILE='~/.bashrc'
fi

ALIASES_SCRIPT='.dotfiles/aliases.sh'

if [[ ! -d "$HOME/$DIR" ]];then
    echo "--- Clone repository ---"
    #echo "$GIT clone https://github.com/kisphp/dotfiles.git $HOME/$DIR"
    $GIT clone https://github.com/kisphp/dotfiles.git "$HOME/$DIR"
fi

if [[ ! `cat ~/.zshrc | grep "$ALIASES_SCRIPT"` ]]; then
    echo "--register aliases--"
    echo ". ~/$ALIASES_SCRIPT" >> ~/.zshrc
fi

echo " "
echo "-----Installed-----"
echo " "
