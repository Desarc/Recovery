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

# .NET 5
wget https://packages.microsoft.com/config/ubuntu/21.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-5.0

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

# kubectl
sudo apt-get install -y apt-transport-https ca-certificates curl
sudo curl -fsSLo /usr/share/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg
echo "deb [signed-by=/usr/share/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# helm
curl https://baltocdn.com/helm/signing.asc | sudo apt-key add -
sudo apt-get install apt-transport-https --yes
echo "deb https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install helm

helm repo add stable https://charts.helm.sh/stable
helm repo add dips https://artifacts.dips.local/artifactory/helm

source ~/.bashrc

cat ~/.ssh/id_rsa.pub

echo "See https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly for additional docker setup"