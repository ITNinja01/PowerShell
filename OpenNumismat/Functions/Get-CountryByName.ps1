function Get-CountryByName {
<#
.SYNOPSIS
This function retrieves coins from a JSON file based on the country's name.
.DESCRIPTION
The Get-CountryByName function reads a JSON file containing coin data and filters the coins based on the specified country name.
.COMPONENT
OpenNumismat
.PARAMETER Name
The name of the country to filter the coins.
.EXAMPLE
Get-CountryByName -name "United States"
.NOTES
Developer: ITNinja01
Date: 11-12-2026   
Version: 1.1.0
#>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        $Name
    )    

    Test-JSONConnection

    if (Test-Path $global:JsonCoins) {
        $Coins = Get-Content -Path  $JsonCoins -raw | ConvertFrom-Json
        $Coins.coins | select-object country, title, year, grade | Where-Object { $_.country -eq "$Name" }
    }
}  