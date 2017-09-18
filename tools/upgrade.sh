#!/usr/bin/env bash

# update lock file will be updated for the next period
_upgrade_dotfiles_timestamp () {
    # next five days
    TIMESTAMP=$(echo $(date +%s) + $KP_UPGRADE_DAYS | bc)

    echo "${TIMESTAMP}" > "${DOTFILES}/logs/.dotfiles_last_update"
}

# upgrade dotfiles tool
# this can be called directly without any confirmation
_upgrade_dotfiles () {
    dotfiles_log "Upgrading dotfiles request" "Upgrade dotfiles"
    CURRENT_DIRECTORY=$(pwd)
    cd "${DOTFILES}"

    if [[ ! -f "${DOTFILES}/custom.sh" ]]; then
        infoText "Write custom.sh file"
        cp "${DOTFILES}/custom.sh.dist" ~/.dotfiles/custom.sh
    fi

    git fetch
    CURRENT_COMMIT_HASH=$(git rev-parse --verify HEAD)
    REMOTE_COMMIT_HASH=$(git rev-parse --verify origin/master)

    dotfiles_log "Git local: ${CURRENT_COMMIT_HASH} - Git remote: ${REMOTE_COMMIT_HASH}" "Upgrade dotfiles"

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

# this method check if it is time to update the tool
# the update lock file will be updated for the next period
_should_upgrade () {
    if [[ $KP_UPGRADE_DAYS -eq 0 ]];then
        dotfiles_log "upgrade disabled" "Dotfiles"
        return 0
    fi

    if [[ ! -f "${DOTFILES}/logs/.dotfiles_last_update" ]]; then
        _upgrade_dotfiles_timestamp
    fi

    NEXT_UPDATE=$(cat ${DOTFILES}/logs/.dotfiles_last_update)
    if [[ $NEXT_UPDATE -lt $(date +%s) ]]; then
        echo "${INFO}${BLACKTEXT} [Kisphp Dotfiles] Would you like to check for updates ? [Y|n] ${NC}"
        read line
        if [[ "$line" == Y* ]] || [[ "$line" == y* ]] || [ -z "$line" ]; then
            _upgrade_dotfiles
        fi
        _upgrade_dotfiles_timestamp
    fi
}

# check if it needs upgrade on every load
_should_upgrade
