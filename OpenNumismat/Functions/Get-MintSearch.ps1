function Get-MintSearch {
<#
.SYNOPSIS
This function retrieves coins from a JSON file based on the coin's mint.
.DESCRIPTION
The Get-MintSearch function reads a JSON file containing coin data and filters the coins based on the specified mint.
.COMPONENT
OpenNumismat
.PARAMETER Search
The mint of the coin to search for. The function will return coins that match this mint.
.EXAMPLE
Get-MintSearch -Search "San Francisco"
.NOTES
Developer: ITNinja01
Date: 11-13-2026
Version: 2.1.0
#>

[CmdletBinding()]
param(
[Parameter(Mandatory)]
    [string]
    [ValidateNotNullOrEmpty()]
    $Search
)

    test-JSONConnection

    if (Test-Path $global:JsonCoins) {
        $Coins = Get-Content -Path  $JsonCoins -raw | ConvertFrom-Json
        $Coins.coins | select-object country, title, year, grade, mint | Where-Object { $_.mint -like "*$Search*" }
    }
}  