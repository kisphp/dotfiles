#!/bin/bash

# Path to your oh-my-zsh installation.
export DOTFILES=$HOME/.dotfiles

# load tools libraries
. "${DOTFILES}/tools/print.sh"

# load plugins
for PLUGIN in $(find $DOTFILES/plugins -type f -name '*.plugin.sh'); do
    . $PLUGIN
done

# load custom aliases
. "${DOTFILES}/custom.sh"
