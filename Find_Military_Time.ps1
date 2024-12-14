<#
.SYNOPSIS
This script tells time in military time and 12-hour clock system
#>

$Military_Time = get-date -Format  "HH:mm:ss"
$Time_Zone =   get-timeZone | select id  -ExpandProperty id

##carriage return to make it easier to read in the terminal
$crlf = [Environment]::NewLine

$crlf
Write-Host "In military time it is $Military_time in the $Time_Zone Zone."
Write-Host "The current date and time is "(get-date)"."
$crlf