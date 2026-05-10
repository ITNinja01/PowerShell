function Get-Mint {
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
Date: 05-09-2026
Version: 2.0.4
#>

    $Mint = Read-Host -Prompt "Type in the mint or part of the mint to search for?"

    if ($global:JsonCoins -eq $null) {
        $global:JsonCoins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
    }

    if (Test-Path $global:JsonCoins) {
        $Coins = Get-Content -Path  $JsonCoins -raw | ConvertFrom-Json
        $Coins.coins | select-object country, title, year, grade, mint | Where-Object { $_.mint -like "*$Mint*" }
    }
}  