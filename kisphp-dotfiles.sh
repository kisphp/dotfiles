#!/bin/bash

# Path to your oh-my-zsh installation.
export DOTFILES=$HOME/.dotfiles

KP_DEBUG=0
KP_LOGS=1
KP_COLORS=1
KP_UPGRADE_DAYS=120
KP_UPGRADE_CONFIRMATION=1

if [ "${KP_DEBUG}" -eq 1 ];then
    set -x
fi

# load tools libraries
. "${DOTFILES}/tools/helpers.sh"
. "${DOTFILES}/tools/logger.sh"
. "${DOTFILES}/tools/print.sh"
. "${DOTFILES}/tools/upgrade.sh"

errorText "This project was moved to GITLAB."
cd $DOTFILES
git remote set-url origin https://gitlab.com/marius-rizac/dotfiles.git
git reset --hard
git pull --rebase -v
cd -

if [ "${KP_DEBUG}" -eq 1 ];then
    set +x
fi
