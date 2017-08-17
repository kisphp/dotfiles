#!/usr/bin/env bash

. $DOTFILES/print.sh

GIT=`which git`
DIR='.dotfiles'

if [[ -f "$HOME/.zshrc" ]];then
    ZSH_FILE="$HOME/.zshrc"
else
    ZSH_FILE="$HOME/.bashrc"
fi

ALIASES_SCRIPT="$DOTFILES/aliases.sh"

if [[ ! -d "$HOME/$DIR" ]];then
    printf "${BLUE}Cloning Oh My Zsh...${NORMAL}\n"
    hash git >/dev/null 2>&1 || {
        echo "Error: git is not installed"
        exit 1
    }

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
