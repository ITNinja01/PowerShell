function Get-MintYear {
    <#
    .SYNOPSIS
    This function retrieves the mint year of coins from a JSON file.
    .DESCRIPTION
    The Get-MintYear function reads a JSON file containing coin data and extracts the mint year of each coin.
    .PARAMETER Descending
    If set to true, the results will be sorted in descending order by year.
    .EXAMPLE
    Get-MintYear
    This command retrieves the mint year of coins from the specified JSON file.    
    #>
param (
    [Parameter()]
    [bool]
    $Descending = $false
)

if ($global:Json_Coins -eq $null) {
   $global:Json_Coins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
}

if (Test-Path $global:Json_Coins) {
    $Coins = Get-Content -Path  $Json_Coins -raw | ConvertFrom-Json
}
if ($Descending) {
    $Coins.coins | select-object country, title, year, grade | Sort-Object year -Descending
} else {
    $Coins.coins | select-object country, title, year, grade | Sort-Object year
}
}  