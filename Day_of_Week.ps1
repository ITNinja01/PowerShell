<#
.SYNOPSIS
    This script prompts the user to enter a date in the format MM-DD-YYYY and then calculates and displays the day of the week for that date.
#>

$Date = Read-Host "Enter a date MM-DD-YYYY in that format"
$DayOfWeek = (Get-Date $Date).DayOfWeek

Write-Host "The day of the week for $Date was a $DayOfWeek."