#!/usr/bin/env bash
sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install default-jre git nodejs maven npm libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb -y
npm install cypress
npm install mocha
