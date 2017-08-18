#!/bin/bash

# default values for configuration elements
KP_DEBUG=0 # debug mode disabled
KP_LOGS=0 # logs disabled
KP_COLORS=1 # colored text enabled

if [ "${KP_DEBUG}" -eq 1 ];then
    set -x
fi

# Path to your oh-my-zsh installation.
export DOTFILES=$HOME/.dotfiles

# load custom aliases
if [[ ! -f ~/.dotfiles/custom.sh ]]; then
    echo "Write custom.sh file"
    cp ~/.dotfiles/custom.sh.dist ~/.dotfiles/custom.sh
fi
. "${DOTFILES}/custom.sh"

# load tools libraries
. "${DOTFILES}/tools/logger.sh"
. "${DOTFILES}/tools/print.sh"
. "${DOTFILES}/tools/validations.sh"
. "${DOTFILES}/tools/upgrade.sh"

# load plugins
for PLUGIN in $(find $DOTFILES/plugins -type f -name '*.plugin.sh'); do
    . $PLUGIN
done

if [ "${KP_DEBUG}" -eq 1 ];then
    set +x
fi
