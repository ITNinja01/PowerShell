<#
.SYNOPSIS
This script tells time in military time and 12-hour clock system
#>

$MilitaryTime = get-date -Format  "HH:mm:ss"
$TimeZone = get-timeZone | Select-Object id  -ExpandProperty id

##carriage return to make it easier to read in the terminal
$crlf = [Environment]::NewLine

$crlf
Write-Host "In military time it is $MilitaryTime in the $TimeZone Zone."
Write-Host "The current date and time is "(get-date)"."
$crlf