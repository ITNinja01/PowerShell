<#
.SYNOPSIS
This script will calculate the percentage of Windows Windows 11 computers in your environment.
.DESCRIPTION
We need to know the percentage of Windows 11 computers in our environment to track progress of Windows 10 to Windows 11 migrations.
This script prompts for the number of Windows 10 and Windows 11 computers in your environment.
.INPUTS
Number of Windows 10 and Windows 11 computers. This can be done by many ways: Active Directory query, SCCM query, Intune group membership export, or other MDM exports.
.OUTPUTS
Percentage of Windows 11 computers in your environment
#>

[int]$Windows10Computers = Read-Host "Enter the number of the Windows 10 computers in your environment?"
[int]$Windows11Computers = Read-Host "Enter the number of the Windows 11 computers in your environment?"
[int]$AllComputers = $Windows11Computers + $Windows10Computers

$PercentCompleted = [Math]::Round(($Windows11Computers / $AllComputers) * 100, 2)

Clear-Host

write-Host "$PercentCompleted% of the computers in your environment are on Windows 11."

#Nuking (nulling) variables in memory for script to have correct numbers back if used more than once in same session.
Clear-Variable -Name Windows11Computers, Windows10Computers, AllComputers, PercentCompleted