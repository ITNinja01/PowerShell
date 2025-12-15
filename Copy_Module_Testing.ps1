<#
.SYNOPSIS
Copies a PowerShell module to the user's local and OneDrive module directories and imports it.
.DESCRIPTION
This script copies a specified PowerShell module from a given root folder path to the user's local PowerShell Modules directory and, if applicable, to the OneDrive Modules directory. After copying, it imports the module into the current PowerShell session.
.PARAMETER RootFolderPath
The root folder path where the module is located.
.PARAMETER ModuleName
The name of the module to be copied and imported.
.FUNCTIONALITY 
I got tired of manually copying my PowerShell modules to my local and OneDrive module directories every time I made changes. This script automates that process and ensures the module is imported into the current session.
.ROLE
IT Administrator, Powershell Developer
.NOTES
This script has been tested on Windows and Linux.
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    $RootFolderPath,
    [Parameter(Mandatory)]
    $ModuleName
)

# Construct the full module path
$ModulePath = Join-Path -Path $RootFolderPath -ChildPath $ModuleName

if (-not (Test-Path $ModulePath)) {
    Write-Error "$ModulePath does not exist. Please provide a valid path."
    exit 1
}

# Script block to import the module after copying. So I don't have to repeat myself.
$ImportResult = {
    Import-Module -Name $ModuleName -Force -Verbose
}

if ($IsWindows -eq $true) {
    #Paths where module files are stored
    $LocalModulePath = "$env:USERPROFILE\Documents\PowerShell\Modules"
    $OneDrive_Module_Path = "$env:OneDrive\Documents\PowerShell\Modules"
    if (Test-Path $LocalModulePath) {
        Copy-Item -Path $ModulePath -Destination $LocalModulePath -Recurse -Force -Verbose
        & $ImportResult 
    }
    if (Test-Path $OneDrive_Module_Path) {
        & Copy-Item -Path $ModulePath -Destination $OneDrive_Module_Path -Recurse -Force -Verbose
      & $ImportResult 
    }
}
else {
    #Paths where help files are stored in Linux or Mac.
    $LocalModulePath = "/home/$env:USER/.local/share/powershell/Modules"
    Copy-Item -Path $ModulePath -Destination $LocalModulePath -Recurse -Force -Verbose  
    & $ImportResult 
}