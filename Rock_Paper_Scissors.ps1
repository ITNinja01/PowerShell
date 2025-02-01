<#
.SYNOPSIS
This script uses if/else statements to play the game of Rock, Paper, Scissors.
#>

$User_Input = Read-Host -Prompt "Please choose the first letter for (R)ock, (P)aper or (S)cissors?"

if ($User_Input -eq 'r') {
    $User_Choice = 'rock'
}
elseif ($User_Input -eq 'p') {
    $User_Choice = 'paper'
}
elseif ($User_Input -eq 's') {
    $User_Choice = 'scissors'
}
else {
    Write-Host 'Please only choose the first letter for (R)ock, (P)aper or (S)cissors.'
#The next line is needed to restart the script if the user does not choose the correct letters for the game.
    & "$PSScriptRoot\Rock_Paper_Scissors.ps1"
}

$CPU_Choice = Get-Random 'rock', 'paper', 'scissors'

if ($User_Choice -eq $CPU_Choice) {
    Write-Host "There is a tie between $User_Choice and $CPU_Choice!" 
#The next line is needed to restart the script if the game is a tie.
    & "$PSScriptRoot\Rock_Paper_Scissors.ps1"
} 

#If/Else statements for user winning.
if ($User_Choice -eq 'rock' -and $CPU_Choice -eq 'scissors') {
    Write-Host 'You Won! Rock smashes Scissors.'
}
elseif ($User_Input -eq 'paper' -and $CPU_Choice -eq 'rock') {
    Write-Host 'You Won! Paper covers Rock.'
}
elseif ($User_Choice -eq 'scissors' -and $CPU_Choice -eq 'paper') {
    Write-Host 'You Won! Scissors cuts paper.'
}

#If/Else statements for CPU winning.
if ($User_Input -eq 'scissors' -and $CPU_Choice -eq 'rock') {
    Write-Host 'CPU Won! Rock smashes Scissors.'
}
elseif ($User_Choice -eq 'rock' -and $CPU_Choice -eq 'paper') {
    Write-Host 'CPU Won! Paper covers Rock.'
}
elseif ($User_Choice -eq 'paper' -and $CPU_Choice -eq 'scissors') {
    Write-Host 'CPU Win! Scissors cuts paper.'
}