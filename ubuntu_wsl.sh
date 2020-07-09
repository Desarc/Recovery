#!/bin/bash

echo "export cd /c/code" >> ~/.bashrc

# mount drives at /c instead of /mnt/c (fix for docker on WSL)
sudo cp wsl/wsl.conf /etc/wsl.conf

sudo apt-get update -y
sudo apt-get upgrade -y

# zip/unzip
sudo apt-get install zip -y
sudo apt-get install unzip -y

# Java
sudo apt-get install default-jdk -y
sudo apt-get install maven -y

# change path if necessary
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
echo "Setting JAVA_HOME to $JAVA_HOME"
echo "export JAVA_HOME=$JAVA_HOME" >> ~/.bashrc
export JAVA_HOME=$JAVA_HOME

# install SDKMAN!
curl -s "https://get.sdkman.io" |
source ~/.sdkman/bin/sdkman-init.sh

sdk install groovy

# python3
sudo apt-get install python3 -y
echo "alias python=python3" >> ~/.bashrc

# dotnet script
dotnet tool install -g dotnet-script

# ssh key
ssh-keygen -t rsa -b 4096 -C "ori@dips.no"

# docker
sudo apt-get install docker -y

# required for docker login
sudo apt-get install gnupg2 pass -y

# docker-compose
# apt-get installs old version
# sudo apt-get install docker-compose -y
sudo curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

# set vars for docker
echo "export DOCKER_HOST=" >> ~/.bashrc
echo "export DOCKER_TLS_VERIFY=" >> ~/.bashrc
echo "export DOCKER_HOST=tcp://localhost:2375" >> ~/.bashrc

source ~/.bashrc

cat ~/.ssh/id_rsa.pub

echo "See https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly for additional docker setup"