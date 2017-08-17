#!/usr/bin/env bash

. ~/.dotfiles/print.sh

zmodload zsh/datetime

function reload_dotfiles {
    infoText "Reloading dotfiles"
    source ./aliases.sh -u
}

function self_update {
    if [[ "$1" != "-u" ]]; then
        CURRENT_DIRECTORY=`pwd`
        cd ~/.dotfiles

        if [[ ! -f ~/.dotfiles/custom.sh ]]; then
            infoText "Write custom.sh file"
            cp ~/.dotfiles/custom.sh.dist ~/.dotfiles/custom.sh
        fi

        git fetch
        CURRENT_COMMIT_HASH=`git rev-parse --verify HEAD`
        REMOTE_COMMIT_HASH=`git rev-parse --verify origin/master`

        if [[ "$CURRENT_COMMIT_HASH" != "$REMOTE_COMMIT_HASH" ]];then
            infoText "Updating Dotfiles repository ..."
            git pull --rebase origin master
        fi

        cd $CURRENT_DIRECTORY
    else
        reload_dotfiles
    fi
}










