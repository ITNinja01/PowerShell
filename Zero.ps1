<#
.SYNOPSIS
This script implements a simple number guessing game.
.DESCRIPTION
The computer will randomly select a number between 1 and 100. The user will have seven attempts to guess the number. After each guess, the script will provide feedback on whether the guess is too high, too low, or correct. If the user fails to guess the number within seven attempts, the game will end and reveal the correct number. It is a port of an old Commodore 64 game called "Zero".
.LINK 
The original game can be found here:
https://github.com/ITNinja01/BASIC/blob/main/Commodore%2064/zero.bas
#>

Write-Host "Zero
Computer will choose a number between 1 and 100. You will have to guess the number in seven attempts. 
I will give you hints if your guess is too high or too low.
Good Luck!"

$RandomNumber = Get-Random -Minimum 1 -Maximum 100

# Set the number of attempts
$Attempts = 7

while ($Attempts -gt 0) {
    $Guess = Read-Host "Enter your guess (Attempt left: $($Attempts))"
    
    if ($Guess -eq $RandomNumber) {
        Write-Host "Congratulations! You've guessed the number!"
        break
    }
    elseif ($Guess -lt $RandomNumber) {
        Write-Host "Too low! Try again."
    }
    else {
        Write-Host "Too high! Try again."
    }
    
    # Decrement the attempts
    $Attempts--
}

# If the user runs out of attempts, reveal the correct number
if ($Attempts -eq 0) {
    Write-Host "Game Over! The correct number was $RandomNumber."
}