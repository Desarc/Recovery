#!/bin/bash

echo "cd /c/code" >> ~/.bashrc

# mount drives at /c instead of /mnt/c (fix for docker on WSL)
sudo cp wsl/wsl.conf /etc/wsl.conf
sudo chmod 644 /etc/wsl.conf

sudo cp wsl/resolv.conf /etc/resolv.conf
sudo chmod 644 /etc/resolv.conf

sudo apt-get update -y
sudo apt-get upgrade -y

# zip/unzip
sudo apt-get install zip -y
sudo apt-get install unzip -y
sudo apt-get install jq -y

# # python3
sudo apt-get install python3 -y
sudo apt-get install python3-pip -y
echo "alias python=python3" >> ~/.bashrc

# .NET 8
# wget https://packages.microsoft.com/config/ubuntu/22.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
# sudo dpkg -i packages-microsoft-prod.deb
# rm packages-microsoft-prod.deb

# sudo apt-get update; \
#   sudo apt-get install -y apt-transport-https && \
#   sudo apt-get update && \
#   sudo apt-get install -y dotnet-sdk-8.0

# ssh key
# ssh-keygen -t rsa -b 4096 -C "ori@dips.no"

# docker
sudo apt-get install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get update

sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

sudo groupadd docker
sudo gpasswd -a $USER docker
newgrp docker


# kubectl
sudo apt-get install -y apt-transport-https ca-certificates curl gnupg
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.31/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg
sudo chmod 644 /etc/apt/keyrings/kubernetes-apt-keyring.gpg # allow unprivileged APT programs to read this keyring
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.31/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list
sudo chmod 644 /etc/apt/sources.list.d/kubernetes.list   # helps tools such as command-not-found to work correctly

sudo apt-get update
sudo apt-get install -y kubectl

# helm
curl https://baltocdn.com/helm/signing.asc | gpg --dearmor | sudo tee /usr/share/keyrings/helm.gpg > /dev/null
sudo apt-get install -y apt-transport-https
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/helm.gpg] https://baltocdn.com/helm/stable/debian/ all main" | sudo tee /etc/apt/sources.list.d/helm-stable-debian.list
sudo apt-get update
sudo apt-get install -y helm

helm repo add stable https://charts.helm.sh/stable
helm repo add dips https://artifacts.dev.dips.no/helm

RUN curl http://vi-fileshare02.dips.local/cert/dips-root-ca-bundle.zip -o ~/dips-root-ca-bundle.zip
RUN sudo unzip ~/dips-root-ca-bundle.zip -d /usr/local/share/ca-certificates
RUN curl http://vi-fileshare02.dips.local/cert/dips-intermediate-ca-bundle.zip -o ~/dips-intermediate-ca-bundle.zip
RUN sudo unzip ~/dips-intermediate-ca-bundle.zip -d /usr/local/share/ca-certificates
RUN sudo update-ca-certificates

source ~/.bashrc

cat ~/.ssh/id_rsa.pub

echo "See https://nickjanetakis.com/blog/setting-up-docker-for-windows-and-wsl-to-work-flawlessly for additional docker setup"