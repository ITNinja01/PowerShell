function Test-JSONConnection {
<#
.SYNOPSIS
Tests the connection to the JSON file containing coin data.
.DESCRIPTION
The Test-JSONConnection function checks if the JSON file path is set and prompts the user to input the file path if it is not set.
.COMPONENT
OpenNumismat
.EXAMPLE
Test-JSONConnection
.NOTES
Developer: ITNinja01
Date: 11-13-2026
Version: 1.0.0
#>

    if ($null -eq $global:JsonCoins) {
        $global:JsonCoins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
    }
}