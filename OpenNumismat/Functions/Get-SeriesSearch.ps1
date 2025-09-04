<#
.SYNOPSIS
This function retrieves coins from a JSON file based on the coin's series.
.DESCRIPTION
The Get-SeriesSearch function reads a JSON file containing coin data and filters the coins based on the specified series.
.COMPONENT
OpenNumismat
.PARAMETER Series
The series or part of the series of the coin to search for. The function will return coins that match the series pattern.
.EXAMPLE
Get-SeriesSearch
.NOTES
Developer: ITNinja01
Date: 09-03-2025   
Version: 1.0.1
#>

function Get-SeriesSearch {
    $Series = Read-Host -Prompt "Type in the series or part of the series to search for?"

    if ($global:Json_Coins -eq $null) {
        $global:Json_Coins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
    }

    if (Test-Path $global:Json_Coins) {
        $Coins = Get-Content -Path  $Json_Coins -raw | ConvertFrom-Json
        $Coins.coins | select-object country, title, series, year, grade | Where-Object { $_.Series -like "*$Series*" }
    }
}  