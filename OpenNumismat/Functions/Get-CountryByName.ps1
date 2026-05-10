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
Date: 05-09-2026   
Version: 1.0.6
#>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        $Name
    )    

    if ($global:JsonCoins -eq $null) {
        $global:JsonCoins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
    }

    if (Test-Path $global:JsonCoins) {
        $Coins = Get-Content -Path  $JsonCoins -raw | ConvertFrom-Json
        $Coins.coins | select-object country, title, year, grade | Where-Object { $_.country -eq "$Name" }
    }
}  