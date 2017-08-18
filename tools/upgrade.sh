#!/usr/bin/env bash

function _upgrade_dotfiles_timestamp {
    # next five days
    TIMESTAMP=`echo $(date +%s) + 432000 | bc`

    echo "${TIMESTAMP}" > "${DOTFILES}/logs/.dotfiles_last_update"
}

function _upgrade_dotfiles {
    CURRENT_DIRECTORY=`pwd`
    cd "${DOTFILES}"

    if [[ ! -f "${DOTFILES}/custom.sh" ]]; then
        infoText "Write custom.sh file"
        cp "${DOTFILES}/custom.sh.dist" ~/.dotfiles/custom.sh
    fi

    git fetch
    CURRENT_COMMIT_HASH=`git rev-parse --verify HEAD`
    REMOTE_COMMIT_HASH=`git rev-parse --verify origin/master`

    if [[ "$CURRENT_COMMIT_HASH" != "$REMOTE_COMMIT_HASH" ]];then
        infoText "Updating Dotfiles repository ..."
        git pull --rebase origin master
    else
        infoText "Kisphp dotfiles is already latest version"
    fi

    # update timestamp
    _upgrade_dotfiles_timestamp

    cd $CURRENT_DIRECTORY
}

function _should_upgrade {
    NEXT_UPDATE=$(cat ${DOTFILES}/logs/.dotfiles_last_update)

    if [[ $NEXT_UPDATE -lt `date +%s` ]]; then
        echo "${INFO}${BLACKTEXT} [Kisphp Dotfiles] Would you like to check for updates ? [Y|n] ${NC}"
        read line
        if [[ "$line" == Y* ]] || [[ "$line" == y* ]] || [ -z "$line" ]; then
            _upgrade_dotfiles
        fi
        _upgrade_dotfiles_timestamp
    fi
}

_should_upgrade
