#!/bin/bash

GIT=`which git`
DIR='~/.dotfiles'

echo $DIR

ALIASES_SCRIPT='.dotfiles/aliases.sh'

if [[ ! -d "$DIR" ]];then
    echo "$GIT clone https://github.com/kisphp/dotfiles.git $DIR"
    $GIT clone https://github.com/kisphp/dotfiles.git $DIR
else
    rm -rf $DIR
fi

if [[ ! `cat ~/.zshrc | grep "$ALIASES_SCRIPT"` ]]; then
    echo "--register aliases--"
    echo ". ~/$ALIASES_SCRIPT" >> ~/.zshrc
fi

echo " "
echo "-----Installed-----"
echo " "
