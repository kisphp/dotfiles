#!/usr/bin/env bash

# Cancel upgrade if the current user doesn't have write permissions for the dotfiles directory.
[[ -w "${DOTFILES}" ]] || errorText "You don't have permissions on ${DOTFILES} directory"; return 0

# Cancel upgrade if git is unavailable on the system
whence git >/dev/null || errorText "Git is not installed"; return 0
