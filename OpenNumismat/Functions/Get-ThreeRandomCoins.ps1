function Get-ThreeRandomCoins {
<#
.SYNOPSIS
This function retrieves three random coins from a JSON file exported from Open Numismat.
.DESCRIPTION
The function reads a JSON file containing coin data and selects three random coins from it. 
The selected coins are then displayed with their country, title, year, and grade.
.COMPONENT
OpenNumismat
.EXAMPLE
Get-ThreeRandomCoins
 .NOTES
Developer: ITNinja01
Date: 05-09-2026   
Version: 1.0.4
#>

    if ($global:JsonCoins -eq $null) {
        $global:JsonCoins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
    }

    if (Test-Path $global:JsonCoins) {
        $Coins = Get-Content -Path  $JsonCoins -raw | ConvertFrom-Json
        $Coins.coins | select-object country, title, year, grade | get-random -Count 3
    }
}  