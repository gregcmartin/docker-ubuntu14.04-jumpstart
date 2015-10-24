#!/bin/sh
# Docker Jumpstart on Ubuntu 14.0.4 amd64
apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
touch /etc/apt/sources.list.d/docker.list
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list
apt-get update
apt-get purge lxc-docker*
apt-cache policy docker-engine
apt-get upgrade
sudo apt-get install -y linux-image-generic-lts-trusty

# Commands to run after reboot
touch /etc/rc.local
echo "apt-get update"
echo "apt-get -y install docker-engine"
echo "docker run hello-world"
echo """rm -rf /etc/rc.local && touch /etc/rc.local && echo "exit 0" >> /etc/rc.local"""

# other nice stuff to install
apt-get install -y python-pip git

reboot
