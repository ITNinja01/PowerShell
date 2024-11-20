<#
.SYNOPSIS
This script will calculate your BMI using your height in inches and weight in pounds.
#>

#Saving original host colors
$Org_Foreground = (Get-Host).UI.RawUI.ForegroundColor
$Org_Background = (Get-Host).UI.RawUI.BackgroundColor

[Float]$Height = Read-Host -Prompt "Enter your height in inches."
[Float]$Weight = Read-Host -Prompt "Enter your weight in pounds."

Clear-Host

$bmi = [math]::Round(($Weight / ($Height * $Height)) * 703, 2)

Write-Host "Your BMI is $bmi."

if ($bmi -lt 18.5) {
    Write-Host 'You are underweight.' -BackgroundColor Blue -ForegroundColor Green
}
elseif ($bmi -ge 18.5 -and $bmi -lt 25) {
   Write-Host 'You are at a normal weight!' -BackgroundColor Yellow -ForegroundColor Blue
}
elseif ($bmi -ge 25 -and $bmi -lt 30) {
    Write-Host 'You are overweight.' -BackgroundColor Blue -ForegroundColor Magenta
}
elseif ($bmi -ge 30 -and $bmi -lt 40) {
    Write-Host 'You are obese.' -BackgroundColor White -ForegroundColor DarkRed 
}
else {
    Write-Host 'You are morbidly obese' -BackgroundColor White -ForegroundColor Yellow
}

#After changing foreground and background colors resetting back original host colors since PowerShell does hot do this on its own.
(Get-Host).UI.RawUI.ForegroundColor = $Org_Foreground
(Get-Host).UI.RawUI.BackgroundColor = $Org_Background