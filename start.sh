#!/bin/bash

echo "Updating all packages"
  apt-get update -y

  echo "Removing existing ansible"
  apt-get remove ansible -y || true
  echo "Installing Ansible"
  apt-get install software-properties-common -y
  apt-add-repository ppa:ansible/ansible
  apt-get update
  apt-get install ansible -y

  apt-get remove docker docker-engine docker.io || true
  apt-get update -y
  apt-get install \
    linux-image-extra-$(uname -r) \
    linux-image-extra-virtual -y
  apt-get install \
    apt-transport-https \
    ca-certificates \
    software-properties-common -y
  apt-get install curl -y
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
  add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
  apt-get update -y
  apt-get install docker-ce=17.06.0~ce-0~ubuntu -y --force-yes
  curl -L https://github.com/docker/compose/releases/download/1.14.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
