#!/usr/bin/env bash

# start vagrant box and connect
alias vagon='vagrant up && vagrant ssh'

# suspend a vagrant box
alias vagof='vagrant suspend'

# suspend a vagrant box and close terminal window/tab
alias vagoff='vagrant suspend && exit'

# destroy vagrant box
alias vagkill='vagrant destroy'

# destory vagrant box alias
alias vagkil='vagkill'

# find vagrant installed boxes
function findbox {
    find ~/VirtualBox\ Vms -type f -name '*.vbox'
    find ~/VirtualBox_Vms -type f -name '*.vbox'
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
    log "[Git] cloned KVM into ${DIR}"
    git clone https://github.com/kisphp/symfony-vagrant.git $DIR
}
