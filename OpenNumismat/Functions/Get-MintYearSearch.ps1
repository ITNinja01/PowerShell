
<#
.SYNOPSIS
This function retrieves coins from a JSON file based on the coin's mint year.
.DESCRIPTION
The Get-CountryByName function reads a JSON file containing coin data and filters the coins based on the specified mint year.
.COMPONENT
OpenNumismat
.PARAMETER Year
The year of the coin to search for. The function will return coins that match this year.
.EXAMPLE
get-MintYearSearch
.NOTES
Developer: ITNinja01
Date: 06-04-2025   
Version: 1.0.1
#>

function Get-MintYearSearch {
$Year = Read-Host -Prompt "Type in the year or part of the year to search for?"

if ($global:Json_Coins -eq $null) {
   $global:Json_Coins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
}

if (Test-Path $global:Json_Coins) {
    $Coins = Get-Content -Path  $Json_Coins -raw | ConvertFrom-Json
    $Coins.coins | select-object country, title, year, grade | Where-Object { $_.year -like "*$Year*" }
}
}  