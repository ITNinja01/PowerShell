<#
.SYNOPSIS
This script will calculate how much percent of weight you have lost or gained.
#>

#Saving original host colors
$Org_Foreground = (Get-Host).UI.RawUI.ForegroundColor
$Org_Background = (Get-Host).UI.RawUI.BackgroundColor

[Float]$Starting_Weight = Read-Host -Prompt "What is your starting weight?"
[Float]$Current_Weight = Read-Host -Prompt "What is your current weight?"

Clear-Host

if ( $Current_Weight -lt $Starting_Weight) {
    $percent = [Math]::Round((($Current_Weight / $Starting_Weight) - 1) * -1 * 100, 2)
    Write-Host "You have lost $percent% of your body weight." -BackgroundColor Green -ForegroundColor White
}
else {
    $percent = [Math]::Round((($Current_Weight / $Starting_Weight) - 1) * 100, 2)
    Write-Host "You have gained $percent% of your body weight." -BackgroundColor Red -ForegroundColor Yellow
}

#After changing foreground and background colors resetting back original host colors since PowerShell does hot do this on its own.
(Get-Host).UI.RawUI.ForegroundColor = $Org_Foreground
(Get-Host).UI.RawUI.BackgroundColor = $Org_Background