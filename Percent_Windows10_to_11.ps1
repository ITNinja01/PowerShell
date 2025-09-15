<#
.SYNOPSIS
This script will calculate the percentage of Windows 10 and Windows 11 computers in your environment.
.INPUTS
Number of Windows 10 and Windows 11 computers
.OUTPUTS
Percentage of Windows 11 computers in your environment
#>

[int]$Windows11_Computers = Read-Host "Enter the number of the Windows 11 computers in your environment?"
[int]$Windows10_Computers = Read-Host "Enter the number of the Windows 10 computers in your environment?"
[int]$All_Computers = $Windows11_Computers + $Windows10_Computers

$Percent_Completed = [Math]::Round(($Windows11_Computers / $All_Computers) * 100, 2)

Clear-Host

write-Host "$Percent_Completed% of the computers in your environment are on Windows 11."

#Nuking (nulling) variables in memory for script to have correct numbers back if used more than once in same session.
Clear-Variable -Name Windows11_Computers, Windows10_Computers, All_Computers, Percent_Completed