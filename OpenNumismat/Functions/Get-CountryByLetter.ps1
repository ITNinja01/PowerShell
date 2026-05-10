function Get-CountryByLetter {
<#
.SYNOPSIS
This function retrieves coins from a JSON file based on the first letter of their country.
.DESCRIPTION
The Get-CountryByLetter function reads a JSON file containing coin data and filters the coins based on the first letter of the country name.
.COMPONENT
OpenNumismat
.PARAMETER Letter
The first letter of the country name to filter the coins.
.EXAMPLE
Get-CountryByLetter -Letter "A"
.NOTES
Developer: ITNinja01
Date: 05-09-2026   
Version: 1.0.5
#>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]
        [ValidateSet("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")]
        $Letter 
    )    

    if ($global:JsonCoins -eq $null) {
        $global:JsonCoins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
    }

    if (Test-Path $global:JsonCoins) {
        $Coins = Get-Content -Path  $JsonCoins -raw | ConvertFrom-Json
        $Coins.coins | select-object country, title, year, grade | Where-Object { $_.country -like "$Letter*" }
    }
}  
