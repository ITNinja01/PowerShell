<#
.SYNOPSIS
Updates PowerShell help files for the current user.
.DESCRIPTION
I wanted to know what help files were updated and when. This script updates the help files for the current user and checks the last modified date of the help files in the local and OneDrive paths in Windows and for Linux/Macs.
.NOTES
I decided on eight hours as the time frame to check for updated help files. This is because that is a typical workday and I wanted to see if any help files were updated during that time.
#>

Update-help -UICulture ENG -Verbose

$WriteInfo = {
    Write-Host "$HelpFileCount help files updated successfully." -ForegroundColor Green
}

if ($IsWindows -eq $true) {
    #Paths where help files are stored
    $LocalHelpPath = "$env:USERPROFILE\Documents\PowerShell\Help"
    $OneDriveHelpPath = "$env:OneDrive\Documents\PowerShell\Help"

    if (Test-Path $LocalHelpPath) {
        Get-ChildItem $LocalHelpPath -Recurse | Where-Object { $_.LastWriteTime -ge ((get-date).AddHours(-8)) }
        $HelpFileCount = Get-ChildItem $LocalHelpPath -Recurse  -File | Where-Object { $_.LastWriteTime -ge ((get-date).AddHours(-8)) } | Measure-Object | Select-Object Count -ExpandProperty Count
        & $WriteInfo
    }
    if (Test-Path $OneDriveHelpPath) {
        Get-ChildItem $OneDriveHelpPath -Recurse | Where-Object { $_.LastWriteTime -ge ((get-date).AddHours(-8)) }
       $HelpFileCount = Get-ChildItem $OneDriveHelpPath -Recurse  -File | Where-Object { $_.LastWriteTime -ge ((get-date).AddHours(-8)) } | Measure-Object | Select-Object Count -ExpandProperty Count
        & $WriteInfo
    }
}
else {
    #Paths where help files are stored in Linux or Mac.
    $LocalHelpPath = "/home/$env:USER/.local/share/powershell/Help"
    if (Test-Path $LocalHelpPath) {
        Get-ChildItem $LocalHelpPath -Recurse | Where-Object { $_.LastWriteTime -ge ((get-date).AddHours(-8)) }
        $HelpFileCount = Get-ChildItem $LocalHelpPath -Recurse  -File | Where-Object { $_.LastWriteTime -ge ((get-date).AddHours(-8)) } | Measure-Object | Select-Object Count -ExpandProperty Count
        & $WriteInfo
    }
}