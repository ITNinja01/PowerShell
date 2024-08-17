<#
.SYNOPSIS
This script will roll a D and D die
.PARAMETER
The parameter is for which type of die will be cast: "d4","d6","d8","d12","d20".
#>

[CmdletBinding()]   
    param (
        [Parameter(Mandatory=$true)]
        [ValidateSet("d4","d6","d8","d12","d20")]
        $Die  
    )

#After the die is rolled (die type entered) the script will use the correct if statement for the rolled die and Get-Random to generate the number rolled. 
If ($Die -eq 'd4') {
    $roll = Get-Random -Minimum 1 -Maximum 4
    Write-Host "Your $Die rolled a $roll."}
ElseIf  ($Die -eq 'd6') {
    $roll = Get-Random -Minimum 1 -Maximum 6
    Write-Host "Your $Die rolled a $roll."
} 
ElseIf  ($Die -eq 'd8') {
    $roll = Get-Random -Minimum 1 -Maximum 8
    Write-Host "Your $Die rolled a $roll."
}   
ElseIf  ($Die -eq 'd10') {
    $roll = Get-Random -Minimum 1 -Maximum 10
    Write-Host "Your $Die rolled a $roll."
}
ElseIf  ($Die -eq 'd12') {
        $roll = Get-Random -Minimum 1 -Maximum 12
        Write-Host "Your $Die rolled a $roll."
}
ElseIf ($Die -eq 'd20') {
        $roll = Get-Random -Minimum 1 -Maximum 20
        Write-Host "Your $Die rolled a $roll."
}