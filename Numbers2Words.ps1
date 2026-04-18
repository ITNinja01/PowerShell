<#
.SYNOPSIS
Converts a number to words.
.DESCRIPTION
This script takes an integer input and converts it to its equivalent in words using the Humanizer
library. It supports numbers up to the maximum value of Int16 (32767).
.FUNCTIONALITY
Quick way to convert numbers to words for a project I was working on. This script provides a simple interface to achieve that using the Humanizer library.
.COMPONENT
This script requires PowerShell 7 and the Humanizer library. The Humanizer library is already in Powershell 7, so no additional installation is needed.
.PARAMETER Numbers
The integer number that you want to convert to words. It must be between -32768 and 32767.
.EXAMPLE
PS C:\> .\Numbers2Words.ps1 -Numbers 123
Output: "123 is one hundred and twenty-three written out."
.INPUTS
Int16
.OUTPUTS
String
.ROLE
IT Administrator, PowerShell Developer, Mathematician
.NOTES
Author: ITNinja01
Date Created: 04-17-2026
Version: 1.0.0
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [Int16]
    $Numbers
)

$Words = [Humanizer.NumberToWordsExtension]::ToWords($Numbers)

Write-Host "$Numbers is $Words written out."