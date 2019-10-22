#!/bin/bash

sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install zip -y
sudo apt-get install unzip -y

# install SDKMAN!
curl -s "https://get.sdkman.io" | 
source ~/.sdkman/bin/sdkman-init.sh

sdk install groovy