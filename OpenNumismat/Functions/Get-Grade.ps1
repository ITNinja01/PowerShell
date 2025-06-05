<#
.SYNOPSIS
This function retrieves coins from a JSON file based on the coin's grade.
.DESCRIPTION
The Get-Grade function reads a JSON file containing coin data and filters the coins based on the specified grade.
.COMPONENT
OpenNumismat
.PARAMETER Grade
The grade of the coin to search for. The function will return coins that match this grade.
.EXAMPLE
Get-Grade -Grade "01"
.NOTES
Developer: ITNinja01
Date: 06-04-2025   
Version: 1.0
#>
function Get-Grade {
[CmdletBinding()]
param(
[Parameter(Mandatory)]
    [string]
    [ValidateSet("01","02","03","04","06","08","10","12","15","20","25","30","35","40","45","50","53","55","58","60","61","62","63","64","65","66","67","68","69","70","Ungradable")]
    $Grade
)    

if ($global:Json_Coins -eq $null) {
   $global:Json_Coins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
}

if (Test-Path $global:Json_Coins) {
    $Coins = Get-Content -Path  $Json_Coins -raw | ConvertFrom-Json
    $Coins.coins | select-object country, title, year, grade | Where-Object { $_.grade -like "*$Grade*" }
}
}  