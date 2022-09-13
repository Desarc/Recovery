#!/bin/bash

echo "cd /c/code" >> ~/.bashrc

# mount drives at /c instead of /mnt/c (fix for docker on WSL)
sudo cp wsl/wsl.conf /etc/wsl.conf

sudo apt-get update -y
sudo apt-get upgrade -y

# zip/unzip
sudo apt-get install zip -y
sudo apt-get install unzip -y

# # Java
# sudo apt-get install default-jdk -y
# sudo apt-get install maven -y

# # change path if necessary
# JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
# echo "Setting JAVA_HOME to $JAVA_HOME"
# echo "export JAVA_HOME=$JAVA_HOME" >> ~/.bashrc
# export JAVA_HOME=$JAVA_HOME

# # python3
sudo apt-get install python3 -y
sudo apt-get install python3-pip -y
echo "alias python=python3" >> ~/.bashrc

# .NET 6
wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb

sudo apt-get update; \
  sudo apt-get install -y apt-transport-https && \
  sudo apt-get update && \
  sudo apt-get install -y dotnet-sdk-6.0

# dotnet script
dotnet tool install -g dotnet-script

# ssh key
ssh-keygen -t rsa -b 4096 -C "ori@dips.no"

# docker
# remove old versions
sudo apt-get remove docker docker-engine docker.io containerd runc -y

sudo apt-get update
sudo apt-get install ca-certificates curl gnupg lsb-release -y

sudo mkdir -p /etc/apt/keyrings
wget https://download.docker.com/linux/ubuntu/gpg -O /etc/apt/keyrings/docker.gpg
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y

# required for docker login
sudo apt-get install gnupg2 pass -y

# docker-compose
# apt-get installs old version
# sudo apt-get install docker-compose -y
pip3 install docker-compose -y

# minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube_latest_amd64.deb
sudo dpkg -i minikube_latest_amd64.deb
# minikube start

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