function Get-TitleSearch {
<#
.SYNOPSIS
This function retrieves coins from a JSON file based on the coin's title.
.DESCRIPTION
The Get-TitleSearch function reads a JSON file containing coin data and filters the coins based on the specified title.
.COMPONENT
OpenNumismat
.PARAMETER Title
The title or part of the title of the coin to search for. The function will return coins
.EXAMPLE
Get-TitleSearch -TitleSearch "Yellowstone National Park"
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
    $TitleSearch 
)

    Test-JSONConnection

    if (Test-Path $global:JsonCoins) {
        $Coins = Get-Content -Path  $JsonCoins -raw | ConvertFrom-Json
        $Coins.coins | select-object country, title, year, grade | Where-Object { $_.title -like "*$TitleSearch*" }
    }
}  