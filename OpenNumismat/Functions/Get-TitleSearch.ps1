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
Date: 07-05-2025   
Version: 1.0.0
#>

function Get-TitleSearch {
$Title = Read-Host -Prompt "Type in the title or part of the title to search for?"

if ($global:Json_Coins -eq $null) {
   $global:Json_Coins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
}

if (Test-Path $global:Json_Coins) {
    $Coins = Get-Content -Path  $Json_Coins -raw | ConvertFrom-Json
    $Coins.coins | select-object country, title, year, grade | Where-Object { $_.title -like "*$Title*" }
}
}  