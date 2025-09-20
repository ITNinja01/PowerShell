<#
.SYNOPSIS
Updates PowerShell help files for the current user.
.DESCRIPTION
I wanted to know what help files were updated and when. This script updates the help files for the current user and checks the last modified date of the help files in the local and OneDrive paths in Windows and for Linux/Macs.
.NOTES
I decided on eight hours as the time frame to check for updated help files. This is because that is a typical workday and I wanted to see if any help files were updated during that time.
#>

Update-help -UICulture ENG -Verbose -force

$Write_Info = {
    Write-Host "$HelpFile_Count help files updated successfully." -ForegroundColor Green
}

if ($IsWindows -eq $true) {
    #Paths where help files are stored
    $Local_Help_Path = "$env:USERPROFILE\Documents\PowerShell\Help"
    $OneDrive_Help_Path = "$env:OneDrive\Documents\PowerShell\Help"

    if (Test-Path $Local_Help_Path) {
        Get-ChildItem $Local_Help_Path -Recurse | Where-Object { $_.LastWriteTime -ge ((get-date).AddHours(-8)) }   
        $HelpFile_Count = Get-ChildItem $Local_Help_Path -Recurse  -File | Where-Object { $_.LastWriteTime -ge ((get-date).AddHours(-8)) } | Measure-Object | Select-Object Count -ExpandProperty Count
        & $Write_Info
    }
    if (Test-Path $OneDrive_Help_Path) {
        Get-ChildItem $OneDrive_Help_Path -Recurse | Where-Object { $_.LastWriteTime -ge ((get-date).AddHours(-8)) }
       $HelpFile_Count = Get-ChildItem $OneDrive_Help_Path -Recurse  -File | Where-Object { $_.LastWriteTime -ge ((get-date).AddHours(-8)) } | Measure-Object | Select-Object Count -ExpandProperty Count
        & $Write_Info
    }
}
else {
    #Paths where help files are stored in Linux or Mac.
    $Local_Help_Path = "/home/$env:USER/.local/share/powershell/Help"
    if (Test-Path $Local_Help_Path) {
        Get-ChildItem $Local_Help_Path -Recurse | Where-Object { $_.LastWriteTime -ge ((get-date).AddHours(-8)) }
        $HelpFile_Count = Get-ChildItem $Local_Help_Path -Recurse  -File | Where-Object { $_.LastWriteTime -ge ((get-date).AddHours(-8)) } | Measure-Object | Select-Object Count -ExpandProperty Count
        & $Write_Info
    }
}