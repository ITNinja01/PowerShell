function Get-TitleSearch {
<#
.SYNOPSIS
This function retrieves coins from a JSON file based on the coin's title.
.DESCRIPTION
The Get-TitleSearch function reads a JSON file containing coin data and filters the coins based on the specified title.
.COMPONENT
OpenNumismat
.PARAMETER Title
The title or part of the title of the coin to search for. The function will return coins
.EXAMPLE
Get-TitleSearch
.NOTES
Developer: ITNinja01
Date: 05-09-2026   
Version: 1.0.3
#>

    $Title = Read-Host -Prompt "Type in the title or part of the title to search for?"

    if ($global:JsonCoins -eq $null) {
        $global:JsonCoins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
    }

    if (Test-Path $global:JsonCoins) {
        $Coins = Get-Content -Path  $JsonCoins -raw | ConvertFrom-Json
        $Coins.coins | select-object country, title, year, grade | Where-Object { $_.title -like "*$Title*" }
    }
}  