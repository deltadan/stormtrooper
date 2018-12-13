<# 
Azure Guest Agent Reinstall Script
.File Name
 - sildentwagentupgrade.ps1
 
.What calls this script?
 - Manually called from github URI or run from portal or custom script extention
.What does this script do?  
 - Downloads Windows Azure Guest Agent
 - Runs an silent installer
 - Waits for 3 minutes
 - Stops the Windows Azure Guest Agent Service
 - Starts the Windows Azure Guest Agent Service

#>

#Force the Script to run
Set-ExecutionPolicy Bypass -Scope Process -Force

# Download the MSI file from an Azure Storage
$uri = "https://sfcarchivevm.blob.core.windows.net/agent/WindowsAzureVmAgent.2.7.41491.895_181008-1523.fre.msi"
$downloadedFile = "$PSScriptRoot\WindowsAzureVmAgent.2.7.41491.895_181008-1523.fre.msi"
Invoke-WebRequest $uri -OutFile $downloadedFile

# Get Current Version of the Windows Azure Guest Agent
$currentVersion = (Get-Command "C:\WindowsAzure\Packages\GuestAgent\WindowsAzureGuestAgent.exe").FileVersionInfo.FileVersion
Write-Host "$currentVersion is current verison of the Windows Azure Guest Agent"

# Install the Agent
msiexec.exe /i $downloadedFile /quiet

#Sleep for 3 Mins
Start-Sleep -Seconds 180

#Restart the Service
net stop "WindowsAzureGuestAgent"
net start "WindowsAzureGuestAgent"

# Get Upgraded Version of the Windows Azure Guest Agent
$newVersion = (Get-Command "C:\WindowsAzure\Packages\GuestAgent\WindowsAzureGuestAgent.exe").FileVersionInfo.FileVersion
Write-Host "$newVersion is current verison of the Windows Azure Guest Agent"
