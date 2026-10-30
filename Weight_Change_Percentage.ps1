<#
.SYNOPSIS
This script will calculate how much percent of weight you have lost or gained.
#>

#Saving original host colors
$OrgForeground = (Get-Host).UI.RawUI.ForegroundColor
$OrgBackground = (Get-Host).UI.RawUI.BackgroundColor

[Float]$StartingWeight = Read-Host -Prompt "What is your starting weight?"
[Float]$CurrentWeight = Read-Host -Prompt "What is your current weight?"

Clear-Host

if ( $CurrentWeight -lt $StartingWeight) {
    $percent = [Math]::Round((($CurrentWeight / $StartingWeight) - 1) * -1 * 100, 2)
    Write-Host "You have lost $percent% of your body weight." -BackgroundColor Green -ForegroundColor White
}
else {
    $percent = [Math]::Round((($CurrentWeight / $StartingWeight) - 1) * 100, 2)
    Write-Host "You have gained $percent% of your body weight." -BackgroundColor Red -ForegroundColor Yellow
}

#After changing foreground and background colors resetting back original host colors since PowerShell does hot do this on its own.
(Get-Host).UI.RawUI.ForegroundColor = $OrgForeground
(Get-Host).UI.RawUI.BackgroundColor = $OrgBackground