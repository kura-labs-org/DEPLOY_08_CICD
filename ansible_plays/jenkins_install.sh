#!/bin/bash

sudo apt-get update -y

# Jenkins needs git to pull repos
sudo apt-get install git -y

# Jenkins needs java to install and run
sudo apt install openjdk-11-jdk -y

# Obtaining Jenkins key and adding to apt repo
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'

# Update repo so we can install jenkins
sudo apt-get update -y

sudo apt-get install jenkins -y


sudo systemctl daemon-reload
sudo systemctl start jenkins


sudo cat /var/lib/jenkins/secrets/initialAdminPassword > /home/ubuntu/jenksPassword.txt