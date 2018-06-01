#!/bin/bash
###########################################################################################
# Stormtrooper Project 
# MIT License - https://github.com/deltadan/stormtrooper
# Copyright (c) 2018 Dan Patrick - @deltadan
#
#Script Purpose
# - Easy Installer for the Azure CLI
# - You can call this installer from any machine that can download files from GitHub - paste
#   the line below into your terminal.
#  curl -s https://raw.githubusercontent.com/deltadan/stormtrooper/master/docs/install-cli/install-cli.bash | bash -s 
###########################################################################################

#Install Azure CLI on Debian Distro
curl -L https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
AZ_REPO=$(lsb_release -cs)
echo "deb [arch=amd64] https://packages.microsoft.com/repos/azure-cli/ $AZ_REPO main" | sudo tee /etc/apt/sources.list.d/azure-cli.list
sudo apt-key adv --keyserver packages.microsoft.com --recv-keys 52E16F86FEE04B979B07E28DB02C46DF417A0893
sudo apt-get install apt-transport-https
sudo apt-get update && sudo apt-get install azure-cli
