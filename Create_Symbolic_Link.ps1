<#
.SYNOPSIS
Creates a symbolic link, junction, or hard link to a folder.
.DESCRIPTION
This script uses the mklink command to create a symbolic link, junction, or hard link to a specified target directory. The type of link can be specified using the Type parameter.
.COMPONENT
PowerShell, Windows, File System
.FUNCTIONALITY
File System Management
.EXAMPLE
PS> .\Create_Symbolic_Link.ps1 -LinkPath "C:\LinkToFolder" -TargetPath "C:\TargetFolder" -Type SymbolicLink
This command creates a symbolic link at "C:\LinkToFolder" that points to "C:\TargetFolder".
.PARAMETER LinkPath
The path where the symbolic link, junction, or hard link will be created.
.PARAMETER TargetPath
The path to the target directory that the link will point to.
.PARAMETER Type
The type of link to create. Valid values are 'SymbolicLink', 'Junction', and 'HardLink'. The default is 'SymbolicLink'.
.LINK
Explains of how to use `mklink` to create symbolic links, junctions, and hard links in Windows:
https://winbuzzer.com/2024/01/31/how-to-onedrive-folder-sync-any-directory-via-mklink-xcxwbt/  
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]$LinkPath,

    [Parameter(Mandatory)]
    [string]$TargetPath,

    [Parameter(Mandatory)]
    [ValidateSet('SymbolicLink', 'Junction', 'HardLink')]
    [string]$Type
)

if (-not (Test-Path $TargetPath)) {
    New-Item -Path $TargetPath -ItemType Directory -Force 
    Write-Host "Created target directory: $TargetPath"
}

if (Test-Path $LinkPath -ErrorAction SilentlyContinue) {
    New-Item -Path $LinkPath -ItemType Directory -Force
    Write-Host "Write-Host Created target directory: $LinkPath"
}

$HashLinkType = @{
    'SymbolicLink' = 'D'
    'Junction'     = 'J'
    'HardLink'     = 'H'
}

cmd.exe /c "mklink /$($HashLinkType[$Type]) $LinkPath $TargetPath"