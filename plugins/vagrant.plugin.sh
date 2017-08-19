#!/usr/bin/env bash

# start vagrant box and connect
function vagon {
    log "vagrant up && vagrant ssh: ${PWD}" "Vagrant"
    vagrant up && vagrant ssh
}

# suspend a vagrant box
function vagof {
    log "suspend VM: ${PWD}" "Vagrant"
    vagrant suspend
}

# suspend a vagrant box and close terminal window/tab
function vagoff {
    log "suspend VM and exit: ${PWD}" "Vagrant"
    vagrant suspend && exit
}

# destroy vagrant box
function vagkill {
    log "Destroy VM ${PWD}" "Vagrant"
    vagrant destroy
}

# destory vagrant box alias
alias vagkil='vagkill'

# find vagrant installed boxes
function findbox {
    if [[ -d "${HOME}/VirtualBox Vms" ]]; then
        log "Search: ${HOME}/VirtualBox\ Vms" "VirtualBox img search"
        find "${HOME}/VirtualBox Vms" -type f -name '*.vbox'
    fi
    if [[ -d "${HOME}/VirtualBox_Vms" ]]; then
        echo "Search: ${HOME}/VirtualBox_Vms" "VirtualBox img search"
        find $HOME/VirtualBox_Vms -type f -name '*.vbox'
    fi
}

# find vagrant box location
function vagSrc {
    grep -Hrni 'SharedFolder name="vagrant"' $1
}

# download kisphp virtual machine for single symfony project
function kvm {
    if [[ -z $1 ]]; then
        DIR='_vm'
    else
        DIR=$1
    fi
    log "cloned KVM into ${DIR}" Git
    git clone https://github.com/kisphp/symfony-vagrant.git $DIR
}
