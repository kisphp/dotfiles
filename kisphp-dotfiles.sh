#!/bin/bash

KP_DEBUG=0
KP_LOGS=0
if [ "${KP_DEBUG}" -eq 1 ];then
    set -x
fi

# Path to your oh-my-zsh installation.
export DOTFILES=$HOME/.dotfiles

# load tools libraries
. "${DOTFILES}/tools/logger.sh"
. "${DOTFILES}/tools/print.sh"
. "${DOTFILES}/tools/validations.sh"
. "${DOTFILES}/tools/upgrade.sh"

# load plugins
for PLUGIN in $(find $DOTFILES/plugins -type f -name '*.plugin.sh'); do
    . $PLUGIN
done

# load custom aliases
. "${DOTFILES}/custom.sh"

if [ "${KP_DEBUG}" -eq 1 ];then
    set +x
fi
