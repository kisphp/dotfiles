#!/usr/bin/env bash

GIT=`which git`
DIR='.dotfiles'

if [[ -f "$HOME/.zshrc" ]];then
    ZSH_FILE="$HOME/.zshrc"
else
    ZSH_FILE="$HOME/.bashrc"
fi

ALIASES_SCRIPT='.dotfiles/aliases.sh'

if [[ ! -d "$HOME/$DIR" ]];then
    echo "--- Clone repository ---"

    $GIT clone https://github.com/kisphp/dotfiles.git "$HOME/$DIR"
fi

if [[ ! `cat $ZSH_FILE | grep "$ALIASES_SCRIPT"` ]]; then
    echo "--register aliases--"
    echo ". ~/$ALIASES_SCRIPT" >> $ZSH_FILE
fi

echo " "
echo "-----Installed-----"
echo " "
echo "!!!! Don't forget to run:"
echo " "
echo "source $ZSH_FILE"
echo " "
