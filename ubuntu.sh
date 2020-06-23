#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install zip -y
sudo apt-get install unzip -y

sudo apt-get install default-jdk -y
sudo apt-get install maven -y

# change path if necessary
JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
echo "Setting JAVA_HOME to $JAVA_HOME"
sed "$ a export JAVA_HOME=$JAVA_HOME" ~/.bashrc --silent
export JAVA_HOME=$JAVA_HOME

# set vars for docker
sed "$ a export DOCKER_CERT_PATH=" ~/.bashrc --silent
sed "$ a export DOCKER_TLS_VERIFY=" ~/.bashrc --silent
sed "$ a export DOCKER_HOST=tcp://localhost:2375" ~/.bashrc --silent

source ~/.bashrc

# install SDKMAN!
curl -s "https://get.sdkman.io" | 
source ~/.sdkman/bin/sdkman-init.sh

sdk install groovy

dotnet tool install -g dotnet-script

# docker
sudo apt-get install docker
sudo apt-get install docker-compose