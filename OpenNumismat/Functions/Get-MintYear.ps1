function Get-MintYear {
<#
.SYNOPSIS
This function retrieves the mint year of coins from a JSON file.
.DESCRIPTION
The Get-MintYear function reads a JSON file containing coin data and extracts the mint year of each coin.
.COMPONENT
OpenNumismat
.PARAMETER Descending
If set to true, the results will be sorted in descending order by year.
.EXAMPLE
Get-MintYear
.NOTES
Developer: ITNinja01
Date: 05-09-2026   
Version: 1.0.3
#>

    param (
        [Parameter()]
        [bool]
        $Descending = $false
    )

    if ($global:JsonCoins -eq $null) {
        $global:JsonCoins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
    }

    if (Test-Path $global:JsonCoins) {
        $Coins = Get-Content -Path  $JsonCoins -raw | ConvertFrom-Json
    }
    if ($Descending) {
        $Coins.coins | select-object country, title, year, grade | Sort-Object year -Descending
    }
    else {
        $Coins.coins | select-object country, title, year, grade | Sort-Object year
    }
}  