# Installing the Azure CLI on Windows Bash

The purpose of this script is to install the Azure CLI tool on your Debian based Linux distro. Once you have the Azure CLI installed you will then be able to run scripts in the Azure CLI Reference.  You must have this installed if you wish to run these scripts on a windows box.

*Note:* For those running Linux jump to step 2.

1. If you are using Windows you will need to [install](https://docs.microsoft.com/en-us/windows/wsl/install-win10) the Windows Subsystem for Linux and select the Ubuntu image from the Windows Store.
![UbuntuWin](https://docs.microsoft.com/en-us/windows/wsl/media/ubuntustore.png)

1. Paste the following command into your BASH Terminal (must be a Debian Distro)

```
curl -s https://raw.githubusercontent.com/deltadan/stormtrooper/master/docs/install-cli/install-cli.bash | bash -s
```

For more information on installing the Azure CLI review the Microsoft [docs](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli?view=azure-cli-latest).