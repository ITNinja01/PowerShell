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
[int]$Game_Score1 = Read-Host "Enter total pins from game 1"
[int]$Game_Score2 = Read-Host "Enter total pins from game 2"
[int]$Game_Score3 = Read-Host "Enter total pins from game 3"

Clear-Host

#Learned that Write-Host can output multiple lines with a single command using a double-quoted string and line breaks.
Write-Host "Bowling Scores
Game 1: $Game_Score1
Game 2: $Game_Score2
Game 3: $Game_Score3"

#Calculate total and average scores
[int]$Total_Score = $Game_Score1 + $Game_Score2 + $Game_Score3
$Average_Score = [Math]::Round(($Total_Score / 3), 0)

#Output the total and average scores
Write-Host "Your total score for the three games is: $Total_Score"
Write-Host "Your average score per game is: $Average_Score"