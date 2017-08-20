#!/usr/bin/env bash

GIT=$(which git)

# quick git merge and push
function makeup() {
    show_manual makeup $1 && return 0

    ADD=1

    if [[ -z "${1}" ]]; then
        log "makeup without parameters" Error
        echo "${FG_RED}You must provide a comment${NC}"
        echo "${FG_YELLOW}Usage:"
        echo "   ${0} my-comment"
        echo " "
        echo "   or to skip git add"
        echo "   ${0} -n my-comment"
        echo "${NC}"

        return 0
    fi

    while getopts ":n" opt; do
        case $opt in
            n)
                ADD=0
                # unset $1 variable
                shift
                ;;
        esac
    done

    if [[ "${ADD}" == 1 ]];then
        ${GIT} add .
    fi
    ${GIT} commit -m "${*}"
    ${GIT} push
    log "committed message '${*}' and pushed" Git
}

function cln {
    show_manual cln $1 && return 0
    REPOSITORY=$1
    shift

    log "Cloned ${REPOSITORY} $*" Git

    $GIT clone "https://github.com/${REPOSITORY}.git" $*
}

function git_clean_repo {
    log "Start repo cleanup" "Git clean"
    $GIT checkout master &> /dev/null

    log "Run fetch" "Git clean"
    # Make sure we're working with the most up-to-date version of master.
    $GIT fetch

    # Prune obsolete remote tracking branches. These are branches that we
    # once tracked, but have since been deleted on the remote.
    log "[Git clean] prune obsolete tracking branches"
    $GIT remote prune origin

    # List all the branches that have been merged fully into master, and
    # then delete them. We use the remote master here, just in case our
    # local master is out of date.
    log "[Git clean] remove all branches that were merged"
    for br in $($GIT branch --merged origin/master | grep -v 'master$'); do
        log "Deleted branch: ${br} from ${PWD}" "Git clean"
        $GIT branch -D "${br}"
    done

    # Now the same, but including remote branches.
    log "[Git clean] list all branches that were merged + remote"
    MERGED_ON_REMOTE=`$GIT branch -r --merged origin/master | sed 's/ *origin\///' | grep -v 'master$'`

    if [ "$MERGED_ON_REMOTE" ]; then
        infoText "The following remote branches are fully merged and will be removed: ${MERGED_ON_REMOTE}"

        read -p "Continue (y/N)? "
        if [[ "$REPLY" == Y* ]] || [[ "$REPLY" == y* ]]; then
            git branch -r --merged origin/master | sed 's/ *origin\///' \
                | grep -v 'master$' | xargs -I% git push origin :% 2>&1 \
                | grep --colour=never 'deleted'
            successText "Remove branches were successfully deleted: ${MERGED_ON_REMOTE}"
        fi
    fi
}
