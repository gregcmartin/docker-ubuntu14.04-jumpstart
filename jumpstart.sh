#!/bin/sh
# Docker Jumpstart on Ubuntu 14.0.4 amd64
apt-key adv --keyserver hkp://pgp.mit.edu:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
touch /etc/apt/sources.list.d/docker.list
echo "deb https://apt.dockerproject.org/repo ubuntu-trusty main" >> /etc/apt/sources.list.d/docker.list
apt-get update
apt-get purge lxc-docker*
apt-cache policy docker-engine
apt-get -y upgrade
sudo apt-get install -y linux-image-generic-lts-trusty

# Commands to run after reboot
rm -rf /etc/rc.local
touch /etc/rc.local
echo "#!/bin/sh" >> /etc/rc.local
echo "apt-get update" >> /etc/rc.local
echo "apt-get -y install docker-engine" >> /etc/rc.local
echo "docker run hello-world" >> /etc/rc.local
echo """rm -rf /etc/rc.local && touch /etc/rc.local && echo "exit 0" >> /etc/rc.local""" >> /etc/rc.local

# other nice stuff to install
apt-get install -y python-pip git

reboot
