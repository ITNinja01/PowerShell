function Get-MintYearSearch {
<#
.SYNOPSIS
This function retrieves coins from a JSON file based on the coin's mint year.
.DESCRIPTION
The Get-CountryByName function reads a JSON file containing coin data and filters the coins based on the specified mint year.
.COMPONENT
OpenNumismat
.PARAMETER Year
The year of the coin to search for. The function will return coins that match the year pattern.
.EXAMPLE
get-MintYearSearch
.NOTES
Developer: ITNinja01
Date: 05-09-2026  
Version: 1.0.5
#>

    $Year = Read-Host -Prompt "Type in the year or part of the year to search for?"

    if ($global:JsonCoins -eq $null) {
        $global:JsonCoins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
    }

    if (Test-Path $global:JsonCoins) {
        $Coins = Get-Content -Path  $JsonCoins -raw | ConvertFrom-Json
        $Coins.coins | select-object country, title, year, grade | Where-Object { $_.year -like "*$Year*" }
    }
}  