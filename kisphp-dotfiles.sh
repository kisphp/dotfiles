#!/bin/bash

# Path to your oh-my-zsh installation.
export DOTFILES=$HOME/.dotfiles

# create config files in user's home directory if does not exists
if [[ ! -f $HOME/.dotfiles.cfg ]]; then
    cp "${DOTFILES}/.dotfiles.cfg.dist" "${HOME}/.dotfiles.cfg"
fi

# load config file
. "${HOME}/.dotfiles.cfg"

if [ "${KP_DEBUG}" -eq 1 ];then
    set -x
fi

# load tools libraries
. "${DOTFILES}/tools/helpers.sh"
. "${DOTFILES}/tools/logger.sh"
. "${DOTFILES}/tools/print.sh"
. "${DOTFILES}/tools/validations.sh"
. "${DOTFILES}/tools/upgrade.sh"

# load plugins
for PLUGIN in $(find $DOTFILES/plugins -type f -name '*.plugin.sh'); do
    . $PLUGIN
done

# load custom aliases
if [[ ! -f ~/.dotfiles/custom.sh ]]; then
    infoText "Write custom.sh file"
    cp ~/.dotfiles/custom.sh.dist ~/.dotfiles/custom.sh
fi
. "${DOTFILES}/custom.sh"

if [ "${KP_DEBUG}" -eq 1 ];then
    set +x
fi
