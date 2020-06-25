#!/bin/bash

sed "$ a cd /mnt/c/code" ~/.bashrc --silent

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
sed "$ a export JAVA_HOME=$JAVA_HOME" ~/.bashrc --silent
export JAVA_HOME=$JAVA_HOME

# install SDKMAN!
curl -s "https://get.sdkman.io" | 
source ~/.sdkman/bin/sdkman-init.sh

sdk install groovy

# python3
sudo apt-get install python3 -y

# dotnet script
dotnet tool install -g dotnet-script

# docker
sudo apt-get install docker -y
sudo apt-get install docker-compose -y

# set vars for docker
sed "$ a export DOCKER_CERT_PATH=" ~/.bashrc --silent
sed "$ a export DOCKER_TLS_VERIFY=" ~/.bashrc --silent
sed "$ a export DOCKER_HOST=tcp://localhost:2375" ~/.bashrc --silent

source ~/.bashrc