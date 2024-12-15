<#
.SYNOPSIS
A script to tell how many til Christmas using Get-Date
#>

$Today_Date = Get-Date

#Adding + 1 since people count the day that it still is (today).
$Days_Til_Christmas = 359 - $Today_Date.DayOfYear + 1

Write-Host "$Days_Til_Christmas until Christmas ⛪🎅❄️🎄!" 