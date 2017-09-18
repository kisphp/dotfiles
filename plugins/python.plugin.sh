#!/usr/bin/env bash

alias p2='python2'
alias p3='python3'

# https://stackoverflow.com/questions/2720014/upgrading-all-packages-with-pip
pipup () {
    $(which pip) freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 sudo pip install -U
}
