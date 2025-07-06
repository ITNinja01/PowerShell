<#
.SYNOPSIS
This function retrieves coins from a JSON file based on the coin's mint.
.DESCRIPTION
The Get-Mint function reads a JSON file containing coin data and filters the coins based on the specified mint.
.COMPONENT
OpenNumismat
.PARAMETER Mint
The mint of the coin to search for. The function will return coins that match this mint.
.EXAMPLE
Get-Mint -Mint "San Francisco"
.NOTES
Developer: ITNinja01
Date: 07-05-2025   
Version: 2.0
#>

function Get-Mint {
$Mint = Read-Host -Prompt "Type in the mint or part of the mint to search for?"

if ($global:Json_Coins -eq $null) {
   $global:Json_Coins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
}

if (Test-Path $global:Json_Coins) {
    $Coins = Get-Content -Path  $Json_Coins -raw | ConvertFrom-Json
    $Coins.coins | select-object country, title, year, grade, mint | Where-Object { $_.mint -like "*$Mint*" }
}
}  