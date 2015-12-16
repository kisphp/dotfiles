#!/bin/bash

# DEBIAN INSTALL required software

# run as root
apt-get update
apt-get upgrade
apt-get -y install vim tree mc nodejs npm curl git sudo
cp /etc/vim/vimrc /etc/vim/vimrc.original
wget http://old.kisphp.net/vimrc.txt -O /etc/vim/vimrc
ln -s /sbin/ifconfig /bin/ifconfig
update-alternatives --config editor

USER=`cat /etc/passwd | grep 1000 | cut -d':' -f1`

su $USER
ssh-keygen -b 2048 -t rsa -f /tmp/sshkey -q -N ""

echo "function getip {" >> /home/$USER/.bashrc
echo "    /bin/ifconfig | /bin/grep 'inet addr' | /usr/bin/cut -d':' -f2 | /usr/bin/cut -d' ' -f1" >> /home/$USER/.bashrc
echo "}" >> /home/$USER/.bashrc
echo "" >> /home/$USER/.bashrc
echo "' '" >> /home/$USER/.bashrc
echo "getip" >> /home/$USER/.bashrc
echo "' '" >> /home/$USER/.bashrc

ifconfig | grep 'inet addr' | cut -d':' -f 2 | cut -d' ' -f 1
