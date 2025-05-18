function Get-ThreeRandomCoins {
    <#
    .SYNOPSIS
    This function retrieves three random coins from a JSON file exported from Open Numismat.
    .DESCRIPTION
    The function reads a JSON file containing coin data and selects three random coins from it. 
    The selected coins are then displayed with their country, title, year, and grade.
    .EXAMPLE
    Get-ThreeRandomCoins
    This command retrieves three random coins from the specified JSON file and displays their details.
    #>

if ($global:Json_Coins -eq $null) {
   $global:Json_Coins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
}

if (Test-Path $global:Json_Coins) {
    $Coins = Get-Content -Path  $Json_Coins -raw | ConvertFrom-Json
    $Coins.coins | select-object country, title, year, grade | get-random -Count 3
}
}  