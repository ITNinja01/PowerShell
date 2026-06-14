<#
.SYNOPSIS
This script uses if/else statements to play the game of Rock, Paper, Scissors.
#>

$UserInput = Read-Host -Prompt "Please choose the first letter for (R)ock, (P)aper or (S)cissors?"

if ($UserInput -eq 'r') {
    $UserChoice = 'rock'
}
elseif ($UserInput -eq 'p') {
    $UserChoice = 'paper'
}
elseif ($UserInput -eq 's') {
    $UserChoice = 'scissors'
}
else {
    Write-Host 'Please only choose the first letter for (R)ock, (P)aper or (S)cissors.'
    #The next line is needed to restart the script if the user does not choose the correct letters for the game.
    & "$PSScriptRoot\Rock_Paper_Scissors.ps1"
}

$CPUChoice = Get-Random 'rock', 'paper', 'scissors'

if ($UserChoice -eq $CPUChoice) {
    Write-Host "There is a tie between $UserChoice and $CPUChoice!" 
    #The next line is needed to restart the script if the game is a tie.
    & "$PSScriptRoot\Rock_Paper_Scissors.ps1"
} 

#If/Else statements for user winning.
if ($UserChoice -eq 'rock' -and $CPUChoice -eq 'scissors') {
    Write-Host 'You Won! Rock smashes Scissors.'
}
elseif ($UserInput -eq 'paper' -and $CPUChoice -eq 'rock') {
    Write-Host 'You Won! Paper covers Rock.'
}
elseif ($UserChoice -eq 'scissors' -and $CPUChoice -eq 'paper') {
    Write-Host 'You Won! Scissors cuts paper.'
}

#If/Else statements for CPU winning.
if ($UserInput -eq 'scissors' -and $CPUChoice -eq 'rock') {
    Write-Host 'CPU Won! Rock smashes Scissors.'
}
elseif ($UserChoice -eq 'rock' -and $CPUChoice -eq 'paper') {
    Write-Host 'CPU Won! Paper covers Rock.'
}
elseif ($UserChoice -eq 'paper' -and $CPUChoice -eq 'scissors') {
    Write-Host 'CPU Win! Scissors cuts paper.'
}