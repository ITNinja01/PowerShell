<#
.SYNOPSIS
This script uses if/else statements to play the game of Rock, Paper, Scissors, Bear, Hunter, Ninja.
#>

$UserInput = Read-Host -Prompt "Please choose the first letter for (R)ock, (P)aper or (S)cissors, (B)ear, (H)unter or (N)inja ?"

if ($UserInput -eq 'r') {
    $UserChoice = 'rock'
}
elseif ($UserInput -eq 'p') {
    $UserChoice = 'paper'
}
elseif ($UserInput -eq 's') {
    $UserChoice = 'scissors'
}
elseif ($UserInput -eq 'b') {
    $UserChoice = 'bear'
}
elseif ($UserInput -eq 'h') {
    $UserChoice = 'hunter'
}
elseif ($UserInput -eq 'n') {
    $UserChoice = 'ninja'
}
else {
    Write-Host 'Please only choose the first letter for (R)ock, (P)aper or (S)cissors, (B)ear, (H)unter or (N)inja.'
    #The next line is needed to restart the script if the user does not choose the correct letters for the game.
    & "$PSScriptRoot\Rock_Paper_Scissors_Bear_Hunter_Ninja.ps1"
}

$CPUChoice = Get-Random 'rock', 'paper', 'scissors', 'bear', 'hunter', 'ninja'

if ($UserChoice -eq $CPUChoice) {
    Write-Host "There is a tie between $UserChoice and $CPUChoice!" 
    #The next line is needed to restart the script if the game is a tie.
    & "$PSScriptRoot\Rock_Paper_Scissors_Bear_Hunter_Ninja.ps1"
} 

#If/Else statements for user winning.
if ($UserChoice -eq 'rock' -and $CPUChoice -eq 'scissors') {
    Write-Host 'You Won! Rock smashes Scissors.'
}
elseif ($UserChoice -eq 'paper' -and $CPUChoice -eq 'rock') {
    Write-Host 'You Won! Paper covers Rock.'
}
elseif ($UserChoice -eq 'scissors' -and $CPUChoice -eq 'paper') {
    Write-Host 'You Won! Scissors cuts paper.'
}
elseif ($UserChoice -eq 'bear' -and $CPUChoice -eq 'hunter') {
    Write-Host 'You Won! Bear mauls Hunter.'
}
elseif ($UserChoice -eq 'hunter' -and $CPUChoice -eq 'ninja') {
    Write-Host 'You Won! Hunter shoots Ninja.'
}
elseif ($UserChoice -eq 'ninja' -and $CPUChoice -eq 'bear') {
    Write-Host 'You Won! Ninja stabs Bear.'
}
elseif ($UserChoice -eq 'rock' -and $CPUChoice -eq 'bear') {
    Write-Host 'You Won! Rock crushes Bear.'
}
elseif ($UserChoice -eq 'bear' -and $CPUChoice -eq 'scissors') {
    Write-Host 'You Won! Bear crushes Scissors.'
}
elseif ($UserChoice -eq 'bear' -and $CPUChoice -eq 'paper') {
    Write-Host 'You Won! Bear eats paper.'
}
elseif ($UserChoice -eq 'hunter' -and $CPUChoice -eq 'scissors') {
    Write-Host 'You Won! Hunter shoots Scissors.'
}
elseif ($UserChoice -eq 'hunter' -and $CPUChoice -eq 'rock') {
    Write-Host 'You Won! Hunter uses rock as cover.'
}
elseif ($UserChoice -eq 'hunter' -and $CPUChoice -eq 'paper') {
    Write-Host 'You Won! Hunter uses paper as a map.'
}
elseif ($UserChoice -eq 'ninja' -and $CPUChoice -eq 'scissors') {
    Write-Host 'You Won! Ninja disarmed the scissors.'
}
elseif ($UserChoice -eq 'rock' -and $CPUChoice -eq 'ninja') {
    Write-Host 'You Won! Rock crushes Ninja.'
}
elseif ($UserChoice -eq 'ninja' -and $CPUChoice -eq 'paper') {
    Write-Host 'You Won! Ninja steals the secret plans.'
}

#If/Else statements for CPU winning.
if ($CPUChoice -eq 'rock' -and $UserChoice -eq 'scissors') {
    Write-Host 'CPU Won! Rock smashes Scissors.'
}
elseif ($CPUChoice -eq 'paper' -and $UserChoice -eq 'rock') {
    Write-Host 'CPU Won! Paper covers Rock.'
}
elseif ($CPUChoice -eq 'scissors' -and $UserChoice -eq 'paper') {
    Write-Host 'CPU Won! Scissors cuts paper.'
}
elseif ($CPUChoice -eq 'bear' -and $UserChoice -eq 'hunter') {
    Write-Host 'CPU Won! Bear mauls Hunter.'
}
elseif ($CPUChoice -eq 'hunter' -and $UserChoice -eq 'ninja') {
    Write-Host 'CPU Won! Hunter shoots Ninja.'
}
elseif ($CPUChoice -eq 'ninja' -and $UserChoice -eq 'bear') {
    Write-Host 'CPU Won! Ninja stabs Bear.'
}
elseif ($CPUChoice -eq 'rock' -and $UserChoice -eq 'bear') {
    Write-Host 'CPU Won! Rock crushes Bear.'
}
elseif ($CPUChoice -eq 'bear' -and $UserChoice -eq 'scissors') {
    Write-Host 'CPU Won! Bear crushes Scissors.'
}
elseif ($CPUChoice -eq 'bear' -and $UserChoice -eq 'paper') {
    Write-Host 'CPU Won! Bear eats paper.'
}
elseif ($CPUChoice -eq 'hunter' -and $UserChoice -eq 'scissors') {
    Write-Host 'CPU Won! Hunter shoots Scissors.'
}
elseif ($CPUChoice -eq 'hunter' -and $UserChoice -eq 'rock') {
    Write-Host 'CPU Won! Hunter uses rock as cover.'
}
elseif ($CPUChoice -eq 'hunter' -and $UserChoice -eq 'paper') {
    Write-Host 'CPU Won! Hunter uses paper as a map.'
}
elseif ($CPUChoice -eq 'ninja' -and $UserChoice -eq 'scissors') {
    Write-Host 'CPU Won! Ninja disarmed the scissors.'
}
elseif ($CPUChoice -eq 'rock' -and $UserChoice -eq 'ninja') {
    Write-Host 'CPU Won! Rock crushes Ninja.'
}
elseif ($CPUChoice -eq 'ninja' -and $UserChoice -eq 'paper') {
    Write-Host 'CPU Won! Ninja steals the secret plans.'
}