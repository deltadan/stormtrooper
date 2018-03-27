#!/bin/bash
###########################################################################################
# Stormtrooper Project 
# MIT License - https://github.com/deltadan/stormtrooper
# Copyright (c) 2018 Dan Patrick - @deltadan
#
#Script Purpose
# - Install dotnet core 2 on Linux
###########################################################################################


curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/microsoft-ubuntu-xenial-prod xenial main" > /etc/apt/sources.list.d/dotnetdev.list'
sudo apt-get update
sudo apt-get install dotnet-sdk-2.0.2