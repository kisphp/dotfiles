#!/usr/bin/env bash

. ~/.dotfiles/kisphp-dotfiles.sh

echo -e "What ${INFO}username${NC} would you like to use for git ?"
read username
echo -e "What ${INFO}email${NC} would you like to use for git ?"
read email

labelText "set global git username --->${BG_BLACK}${FG_GREEN} ${username}${NC}"
git config --global user.name "${username}"

labelText "set global user email --->${BG_BLACK}${FG_GREEN} ${email}${NC}"
git config --global user.email "${email}"

labelText "Display the command-line UI in color"
git config --global color.ui true

#(note that you probably want to set this to false (or just fetch+merge instead of pull) when working on a shared remote branch (trains are fine). See https://git-scm.com/book/en/v2/Git-Branching-Rebasing)
labelText "When pulling code, always rebase your local changes"
git config --global pull.rebase true

labelText "When pushing code, always push only your current branch to a branch of the same name"
git config --global push.default current

labelText "Automatically prune deleted branches from your local copy when you fetch (or pull)"
git config --global fetch.prune true

labelText "Tell git not to mess with your line endings"
git config --global core.autocrlf false

labelText "Show branch names with git log"
git config --global log.decorate short

labelText "Enable parallel index preload for operations like git diff"
git config --global core.preloadindex true

labelText "Git for Windows offers a filesystem cache which accelerates operations in many cases, after an initial 'warm-up'"
git config --global core.fscache true

labelText "Ignore symlinks"
git config --global core.symlinks false

labelText "Disable SSL verify"
git config --global http.sslVerify false

successText "GIT setup finished"
