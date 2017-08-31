#!/usr/bin/env bash

alias p2='python2'
alias p3='python3'

function pipup {
    $(which pip) freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
}
