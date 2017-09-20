#!/usr/bin/env bash

# destory vagrant box alias
alias vsh='vagrant ssh'
alias vup='vagrant up'
alias vst='vagrant status'

# start vagrant box and connect
vagon () {
    dotfiles_log "vagrant up && vagrant ssh: ${PWD}" "Vagrant"
    vagrant up && vagrant ssh
}

# suspend a vagrant box
vagof () {
    dotfiles_log "suspend VM: ${PWD}" "Vagrant"
    vagrant suspend
}

# suspend a vagrant box and close terminal window/tab
vagoff () {
    dotfiles_log "suspend VM and exit: ${PWD}" "Vagrant"
    vagrant suspend $@ && exit
}

vagkil () {
    dotfiles_log "Destroy VM ${PWD}" "Vagrant"
    vagrant destroy $@
}

# destroy vagrant box
vagkill () {
    vagkil $@
    exit
}

# find vagrant installed boxes
findbox () {
    if [[ -d "${HOME}/VirtualBox Vms" ]]; then
        dotfiles_log "Search: ${HOME}/VirtualBox\ Vms" "VirtualBox img search"
        find "${HOME}/VirtualBox Vms" -type f -name '*.vbox'
    fi
    if [[ -d "${HOME}/VirtualBox_Vms" ]]; then
        dotfiles_log "Search: ${HOME}/VirtualBox_Vms" "VirtualBox img search"
        find $HOME/VirtualBox_Vms -type f -name '*.vbox'
    fi
}

# find vagrant box location
vagSrc () {
    grep -Hrni 'SharedFolder name="vagrant"' "$1"
}

listbox () {
    # get list of vagrant boxes and save it to a file
    findbox > /tmp/findbox.list

    IFS=$'\n' # make new lines the only separator
    for line in $(cat /tmp/findbox.list)
    do
        # display result
        vagSrc "$line"
    done

    # remove temporary file
    rm /tmp/findbox.list
}

# download kisphp virtual machine for single symfony project
kvm () {
    if [[ -z $1 ]]; then
        DIR='_vm'
    else
        DIR=$1
    fi
    dotfiles_log "cloned KVM into ${DIR}" Git
    cln "kisphp/symfony-vagrant" "${DIR}"
}
