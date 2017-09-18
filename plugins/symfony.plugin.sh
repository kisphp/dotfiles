#!/usr/bin/env bash

if [[ $(whence sf) == "" ]];then
    sf () {
        if [[ -f app/console ]];then
            dotfiles_log "Run console from app directory $(pwd)" "symfony"
            app/console $@
            return 0
        fi
        if [[ -f bin/console ]];then
            dotfiles_log "Run console from bin directory $(pwd)" "symfony"
            bin/console $@
            return 0
        fi
        if [[ -f vendor/bin/console ]];then
            dotfiles_log "Run console from vendor/bin directory $(pwd)" "symfony"
            vendor/bin/console $@
            return 0
        fi

        errorText "Symfony console could not be found in directory $(pwd)"
        return 1
    }
fi
