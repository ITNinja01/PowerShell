<#
.SYNOPSIS
This script simulates rolling a specified number of dice and displays the results.
.DESCRIPTION
This script allows the user to specify the number of dice to roll. It then rolls the dice, displays each die face, and shows the total sum of all rolls.
.EXAMPLE
Dice.ps1 -NumberOfDice 3
.INPUTS
This script accepts an integer input specifying the number of dice to roll.
.OUTPUTS
This script outputs the total sum of all dice rolls.
.NOTES
Developed by ITNinja01
Date: 10-20-2026
Version: 1.0.0
#>
[CmdletBinding()]
param(
    [int]$NumberOfDice = 1
)

$DieFace1 = @"
+-------+
|       |
|   •   |
|       |
+-------+
    1
"@    
$DieFace2 = @"
+-------+
| •     |
|       |
|     • |
+-------+
    2
"@
$DieFace3 = @"
+-------+
| •     |
|   •   |
|     • |
+-------+
    3
"@
$DieFace4 = @"
+-------+
| •   • |
|       |
| •   • |
+-------+
    4
"@
$DieFace5 = @"
+-------+
| •   • |
|   •   |
| •   • |
+-------+
    5
"@
$DieFace6 = @"
+-------+
| •   • |
| •   • |
| •   • |
+-------+
    6
"@

# Hashtable mapping each die roll to its corresponding action
function RollActionFunction {
    $RollAction = @{
        1 = { Write-Host "$DieFace1 " }
        2 = { Write-Host "$DieFace2 " }
        3 = { Write-Host "$DieFace3 " }
        4 = { Write-Host "$DieFace4 " }
        5 = { Write-Host "$DieFace5 " }
        6 = { Write-Host "$DieFace6 " }
    }
    if ($RollAction.ContainsKey($Roll)) {
        $RollAction[$Roll].Invoke()
    }
}   

#Compute the total sum of all dice rolls and display each die face
$Rolls = 0
for ($I = 0; $I -lt $NumberOfDice; $I++) {
    $Roll = Get-Random -Minimum 1 -Maximum 7
    $Rolls += $Roll
    RollActionFunction

}

#Output the total sum of all dice rolls
Write-Host "Total sum of all dice rolls: $Rolls"