#!/bin/bash
# Install docker
# Update & upgrade instance
sudo apt-get update && sudo apt-get upgrade -y

# Install java and the dependencies
sudo apt install openjdk-11-jre-headless -y

sudo apt-get install -y \
  default-jre \
  git \
  nodejs \
  npm \
  maven \
  libgtk2.0-0 \
  libgtk-3-0 \
  libgbm-dev \
  libnotify-dev \
  libgconf-2-4 \
  libnss3 \
  libxss1 \
  libasound2 \
  libxtst6 \
  xauth \
  xvfb

sudo apt-get update && sudo apt-get upgrade -y
#Download dependencies add gpg keys
sudo apt-get install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

#installing the docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)  stable"

#update & upgrade repo
sudo apt-get update && sudo apt-get upgrade -y

# Installing
sudo apt-get install docker-ce
sudo systemctl start docker
sudo systemctl enable docker
