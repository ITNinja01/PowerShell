function Get-SeriesSearch {
<#
.SYNOPSIS
This function retrieves coins from a JSON file based on the coin's series.
.DESCRIPTION
The Get-SeriesSearch function reads a JSON file containing coin data and filters the coins based on the specified series.
.COMPONENT
OpenNumismat
.PARAMETER Series
The series or part of the series of the coin to search for. The function will return coins that match the series pattern.
.EXAMPLE
Get-SeriesSearch -SeriesSearch "America the Beautiful"
.NOTES
Developer: ITNinja01
Date: 11-12-2026
Version: 1.1.0
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [string]
    [validateNotNullOrEmpty()]
    $SeriesSearch 
)

    Test-JSONConnection

    if (Test-Path $global:JsonCoins) {
        $Coins = Get-Content -Path  $JsonCoins -raw | ConvertFrom-Json
        $Coins.coins | select-object country, title, series, year, grade | Where-Object { $_.Series -like "*$SeriesSearch*" }
    }
}  