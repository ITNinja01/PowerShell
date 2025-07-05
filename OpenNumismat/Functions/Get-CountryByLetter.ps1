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
Date: 06-04-2025   
Version: 1.0.2
#>

function Get-CountryByLetter {
[CmdletBinding()]
param(
[Parameter(Mandatory)]
    [string]
    [ValidateSet("A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z")]
    $Letter 
)    

if ($global:Json_Coins -eq $null) {
   $global:Json_Coins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
}

if (Test-Path $global:Json_Coins) {
    $Coins = Get-Content -Path  $Json_Coins -raw | ConvertFrom-Json
    $Coins.coins | select-object country, title, year, grade | Where-Object { $_.country -like "$Letter*" }
}
}  