﻿<#
.SYNOPSIS
This script is as a text-based Magic 8 Ball using an answer file. I created the Magic Ball this way first.
#>

#Asking the user for a question, any input is fine and will not be used in the program. 
$Question = Read-Host "Ask the Magic 8 Ball a Question"

#Getting answers from text file and taking a random answer from the list

$Answers = Get-Content $PSScriptRoot\Magic_8_Ball_Ans.txt
$The_Answer = Get-Random -InputObject $Answers

#Carriage return
$crlf = "`r`n"

#Writes the answer to the screen
Write-Host $crlf $The_Answer $crlf