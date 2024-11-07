<#
.SYNOPSIS
This sciprt emulates a Dungeons & Dragons dice being rolled.
#>

[CmdletBinding()]   
    param (
        [Parameter(Mandatory)]
        [ValidateSet("d4","d6","d8","d10","d12","d20")]
        $Die  
    )

#After the die is rolled (die type entered) the script will use the correct if statement for the rolled die and Get-Random to generate the number rolled. 
If ($Die -eq 'd4') {
    $roll = Get-Random -Minimum 1 -Maximum 5
    Write-Host "Your $Die rolled a $roll."}
ElseIf  ($Die -eq 'd6') {
    $roll = Get-Random -Minimum 1 -Maximum 7
    Write-Host "Your $Die rolled a $roll."
} 
ElseIf  ($Die -eq 'd8') {
    $roll = Get-Random -Minimum 1 -Maximum 9
    Write-Host "Your $Die rolled a $roll."
}   
ElseIf  ($Die -eq 'd10') {
    $roll = Get-Random -Minimum 1 -Maximum 11
    Write-Host "Your $Die rolled a $roll."
}
ElseIf  ($Die -eq 'd12') {
        $roll = Get-Random -Minimum 1 -Maximum 13
        Write-Host "Your $Die rolled a $roll."
}
ElseIf ($Die -eq 'd20') {
        $roll = Get-Random -Minimum 1 -Maximum 21
        Write-Host "Your $Die rolled a $roll."
}