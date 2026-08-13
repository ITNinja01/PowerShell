<#
.SYNOPSIS
This script uses if/else statements to play the game of Rock, Paper, Scissors, Lizard, Spock against the CPU. 
.DESCRIPTION
The user will be prompted to choose either rock, paper, scissors, lizard or spock and the CPU will randomly choose one of those options as well. The script will then determine if the user won, lost or if there is a tie and display the results to the user.
.FUNCTIONALITY
This script is intended for educational purposes to demonstrate the use of if/else statements in PowerShell
.EXAMPLE
PS C:\> .\Rock_Paper_Scissors_Lizard_Spock.ps1
Please choose the first letter for (R)ock, (P)aper or (S)cissors, (L)izard or (SP)ock? R
CPU Won! Paper covers Rock.
#>

$UserInput = Read-Host -Prompt "Please choose the first letter for (R)ock, (P)aper or (S)cissors, (L)izard or (SP)ock?"

if ($UserInput -eq 'r') {
    $UserChoice = 'rock'
}
elseif ($UserInput -eq 'p') {
    $UserChoice = 'paper'
}
elseif ($UserInput -eq 's') {
    $UserChoice = 'scissors'
}
elseif ($UserInput -eq 'l') {
    $UserChoice = 'lizard'
}
elseif ($UserInput -eq 'sp') {
    $UserChoice = 'spock'
}
else {
    Write-Host 'Please only choose (R)ock, (P)aper or (S)cissors, (L)izard or (SP)ock.'
    #The next line is needed to restart the script if the user does not choose the correct letters for the game.
    & "$PSScriptRoot\Rock_Paper_Scissors_Lizard_Spock.ps1"
}

$CPUChoice = Get-Random 'rock', 'paper', 'scissors', 'lizard', 'spock'

if ($UserChoice -eq $CPUChoice) {
    Write-Host "There is a tie between $UserChoice and $CPUChoice!" 
    #The next line is needed to restart the script if the game is a tie.
    & "$PSScriptRoot\Rock_Paper_Scissors_Lizard_Spock.ps1"
} 

#If/Else statements for user winning.
if ($UserChoice -eq 'scissors' -and $CPUChoice -eq 'paper') {
    Write-Host 'You Won! Scissors cuts paper.'
}
elseif ($UserChoice -eq 'paper' -and $CPUChoice -eq 'rock') {
    Write-Host 'You Won! Paper covers Rock.'
} 
elseif ($UserChoice -eq 'rock' -and $CPUChoice -eq 'lizard') {
    Write-Host 'You Won! Rock crushes Lizard.'
}
elseif ($UserChoice -eq 'lizard' -and $CPUChoice -eq 'spock') {
    Write-Host 'You Won! Lizard poisons Spock.'
}
elseif ($UserChoice -eq 'spock' -and $CPUChoice -eq 'scissors') {
    Write-Host 'You Won! Spock smashes Scissors.'
}
elseif ($UserChoice -eq 'scissors' -and $CPUChoice -eq 'lizard') {
    Write-Host 'You Won! Scissors decapitates Lizard.'
}
elseif ($UserChoice -eq 'lizard' -and $CPUChoice -eq 'paper') {
    Write-Host 'You Won! Lizard eats Paper.'
}
elseif ($UserChoice -eq 'paper' -and $CPUChoice -eq 'spock') {
    Write-Host 'You Won! Paper disproves Spock.'
}
elseif ($UserChoice -eq 'spock' -and $CPUChoice -eq 'rock') {
    Write-Host 'You Won! Spock vaporizes Rock.'
}
elseif ($UserChoice -eq 'rock' -and $CPUChoice -eq 'scissors') {
    Write-Host 'You Won! Rock smashes Scissors.'
    
}

#If/Else statements for CPU winning.
if ($CPUChoice -eq 'scissors' -and $UserChoice -eq 'paper') {
    Write-Host 'CPU Won! Scissors cuts paper.'
}
elseif ($CPUChoice -eq 'paper' -and $UserChoice -eq 'rock') {
    Write-Host 'CPU Won! Paper covers Rock.'
} 
elseif ($CPUChoice -eq 'rock' -and $UserChoice -eq 'lizard') {
    Write-Host 'CPU Won! Rock crushes Lizard.'
}
elseif ($CPUChoice -eq 'lizard' -and $UserChoice -eq 'spock') {
    Write-Host 'CPU Won! Lizard poisons Spock.'
}
elseif ($CPUChoice -eq 'spock' -and $UserChoice -eq 'scissors') {
    Write-Host 'CPU Won! Spock smashes Scissors.'
}
elseif ($CPUChoice -eq 'scissors' -and $UserChoice -eq 'lizard') {
    Write-Host 'CPU Won! Scissors decapitates Lizard.'
}
elseif ($CPUChoice -eq 'lizard' -and $UserChoice -eq 'paper') {
    Write-Host 'CPU Won! Lizard eats Paper.'
}
elseif ($CPUChoice -eq 'paper' -and $UserChoice -eq 'spock') {
    Write-Host 'CPU Won! Paper disproves Spock.'
}
elseif ($CPUChoice -eq 'spock' -and $UserChoice -eq 'rock') {
    Write-Host 'CPU Won! Spock vaporizes Rock.'
}
elseif ($CPUChoice -eq 'rock' -and $UserChoice -eq 'scissors') {
    Write-Host 'CPU Won! Rock smashes Scissors.'    
}