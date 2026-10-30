<#
.SYNOPSIS
    This script collects bowling scores for three games, calculates the total and average scores, and displays the results.
.DESCRIPTION
    The script prompts the user to input their scores for three bowling games, computes the total score
.INPUTS
    The script prompts for user input.    
.OUTPUTS
    The script outputs the total and average scores to the console.
    #>
# Enter bowling scores for three games.
[int]$GameScore1 = Read-Host "Enter total pins from game 1"
[int]$GameScore2 = Read-Host "Enter total pins from game 2"
[int]$GameScore3 = Read-Host "Enter total pins from game 3"

Clear-Host

#Learned that Write-Host can output multiple lines with a single command using a double-quoted string and line breaks.
Write-Host "Bowling Scores
Game 1: $GameScore1
Game 2: $GameScore2
Game 3: $GameScore3"

#Calculate total and average scores
[int]$TotalScore = $GameScore1 + $GameScore2 + $GameScore3
$AverageScore = [Math]::Round(($TotalScore / 3), 0)

#Output the total and average scores
Write-Host "Your total score for the three games is: $TotalScore"
Write-Host "Your average score per game is: $AverageScore"