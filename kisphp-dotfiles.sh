#!/bin/bash

# Path to your oh-my-zsh installation.
export DOTFILES=$HOME/.dotfiles


echo "-- hello world --"

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
#. "${DOTFILES}/tools/validations.sh"
. "${DOTFILES}/tools/upgrade.sh"

errorText "This project was moved to GITLAB."
cd $DOTFILES
git remote set-url origin https://gitlab.com/marius-rizac/dotfiles.git
git reset --hard
git pull --rebase -v
cd -

## load plugins
#for PLUGIN in $(find $DOTFILES/plugins -type f -name '*.plugin.sh'); do
#    . $PLUGIN
#done
#
## load custom aliases
#if [[ ! -f ~/.dotfiles/custom.sh ]]; then
#    infoText "Write custom.sh file"
#    cp ~/.dotfiles/custom.sh.dist ~/.dotfiles/custom.sh
#fi
#. "${DOTFILES}/custom.sh"

if [ "${KP_DEBUG}" -eq 1 ];then
    set +x
fi
