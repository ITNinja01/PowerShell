function Get-CountryByName {
    <#
    .SYNOPSIS
    This function retrieves coins from a JSON file based on the country's name.
    .DESCRIPTION
    The Get-CountryByName function reads a JSON file containing coin data and filters the coins based on the specified country name.
    .PARAMETER Name
    The name of the country to filter the coins.
    .EXAMPLE
    Get-CountryByName -name "United States"
    This command retrieves coins from the specified JSON file based on the country's name.
    #>

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
    $Coins.coins | select-object country, title, year, grade | Where-Object { $_.country -is "$Name" }
}
}  