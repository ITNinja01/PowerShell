if ($IsWindows -eq $true) {
    #Paths where module files are stored
    $Local_Module_Path = "$env:USERPROFILE\Documents\PowerShell\Modules"
    $OneDrive_Module_Path = "$env:OneDrive\Documents\PowerShell\Modules"

    if (Test-Path $Local_Module_Path) {
     
    }
    if (Test-Path $OneDrive_Module_Pat) {
       
}
}

else {
    #Paths where help files are stored in Linux or Mac.
    $Local_Module_Path = "/home/$env:USER/.local/share/powershell/Modules"
}