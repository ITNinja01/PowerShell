<#
.SYNOPSIS
This script can convert celsius or fahrenheit to the other temperature scale.
.DESCRIPTION 
This script is a port of this script: https://github.com/ITNinja01/BASIC/blob/main/Commodore%2064/Convert_Degress_v2.bas from my work with a Commodore 64 emulator. I realized this script would be good to be able to run on a more modern computer.
#>  

$FindType = Read-Host -Prompt "Do you want to find celsius or fahrenheit? (c or f)?"

if ($FindType -eq 'c') {
    [Float]$Fahrenheit = Read-Host -Prompt "Enter degrees in fahrenheit?"
    
    #Math equation for finding Celsius from Fahrenheit degrees
    $ConvertedDegree = [math]::Round(($Fahrenheit - 32) * 5 / 9, 2)

    Write-Host "$Fahrenheit degrees fahrenheit is $ConvertedDegree degrees in celsius."
}
elseif ($FindType -eq 'f') {
    [Float]$Celsius = Read-Host -Prompt "Enter degrees in celsius?"

    #Math equation for finding Fahrenheit from Celsius degrees
    $ConvertedDegree = [math]::Round(($Celsius * 9) / 5 + 32, 2)

    Write-Host "$Celsius degrees celsius is $ConvertedDegree degrees in fahrenheit. "
}
else {
    Write-Host "Please use only use 'c' for celsius or 'f' for fahrenheit for the first question."
}