<img src="https://octodex.github.com/images/stormtroopocat.jpg" width="200" height="200" />

# Welcome to Stormtropper!

In DevOps we want NO snowflakes, meaning that everything is the same everytime. Scripting is the only way to ensure that your environments be the same everytime and remove the risk of human error. I write scripts all the time using the Azure CLI, but it feels like I'm always having to figure out the same commands over and over.

Stormtropper is a ever growing library of Azure CLI samples that you can use to build out your scripts quickly without having to do the heavy lifting of figuring out all the switches and commands.

The Stormtroppers in Starwars weren't supposed to think just follow orders, and that's exactly the model of this project! Just find a sample script, tweak to your environment and then execute.

## Azure CLI

The Azure CLI is a powerful and fast tool that can be used to work with almost any service in Azure. The AZ CLI is cross platform and can be installed and run from Windows, Macs, Linux and even a Docker container.

My goal for Stormtropper is to provide real world samples that you can use for your DevOps implementations. Microsoft provides an extensive [reference](https://docs.microsoft.com/en-us/cli/azure/reference-index?view=azure-cli-latest), but I&#39;ve found it be to be much easier if I have an example.

## BASH, Visual Studio Code &amp; Azure CLI Extension

All the scripts in this reference are written in bash.  If you wish to run these scripts natively on Windows you will first need to [install](https://docs.microsoft.com/en-us/windows/wsl/install-win10) the Windows Subsystem for Linux.  After you have bash for Windows up and running you will then need to install the Azure CLI for bash (even if you already had it running for Windows).  You can use this install-cli script from your bash prompt.

All code here using was written using [Visual Studio Code](https://code.visualstudio.com/) with the [Azure CLI Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode.azurecli). The great thing about this product is that it supplies intellisense when you are writing your code and also supports running from within the terminal.
![CODECLI](https://github.com/Microsoft/vscode-azurecli/raw/master/images/in_action.gif)

## Folders

Each of the folders contains scripts that I&#39;ve built for many different types of scenarios.  The folders are broken down into different Azure resource types such as Compute, Storage, Networking or Containers.  In each folder there are sample scripts.  Within each of these folders you will find the specific azure resource names.
```
/networking/vnets
```
## File Names

In the Azure Resource folders there are scripts that will then be named based on the resource name (noun) and the type of action (verb) based on what they script will perform.

For example, a script that will create a new Virtual Network will be named:
```
vnet-create.azcli
```
If the script was going to perform an update to a Virtual Network the verb would be update along with an action.  Here is an example of an update to a virtual network to add custom dns settings:
```
vnet-update-customdns.azcli
```
For scripts that delete resources, the verb would be delete:
```
vnet-delete.azcli
```
## Running scripts

The Azure CLI requires that you authenticate to run commands against your subscription.  Run the following command to authenticate.
```
az login --username [user@domain.com] --password [your-password]
```
## FAQ

Q: Can I help to add scripts to the reference?

A: Yes!  Feel free to create your own scripts or update mine!  Submit a Pull Request!

