$ModulePath = Read-Host -Prompt "Enter the full path of the module you want to copy"

if (-not (Test-Path $ModulePath)) {
    Write-Error "$ModulePath does not exist. Please provide a valid path."
    exit 1
}

$ImportResult = {
    Import-Module -Name $ModulePath -Force -Verbose
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
        $ImportResult 
    }
}

else {
    #Paths where help files are stored in Linux or Mac.
    $LocalModulePath = "/home/$env:USER/.local/share/powershell/Modules"
    Copy-Item -Path $ModulePath -Destination $LocalModulePath -Recurse -Force -Verbose  
    & $ImportResult 
}