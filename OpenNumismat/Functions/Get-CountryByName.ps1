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
Date: 07-05-2025   
Version: 1.0.3
#>

function Get-CountryByName {
[CmdletBinding()]
param(
[Parameter(Mandatory)]
    $Name
)    

if ($global:Json_Coins -eq $null) {
   $global:Json_Coins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
}

if (Test-Path $global:Json_Coins) {
    $Coins = Get-Content -Path  $Json_Coins -raw | ConvertFrom-Json
    $Coins.coins | select-object country, title, year, grade | Where-Object { $_.country -eq "$Name" }
}
}  