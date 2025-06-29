<#
.SYNOPSIS
This script is as a text-based Magic 8 Ball using a YAML file.
#>

#Ensure the required module is installed
$moduleName = 'powershell-yaml'
if (-not (Get-Module -ListAvailable -Name $moduleName)) {
    try {
        Install-Module -Name $moduleName -Scope CurrentUser -Force -ErrorAction Stop -Verbose
    } catch {
        Write-Error "Could not install module '$moduleName'. Please install it manually."
        exit 1
    }
}
Import-Module $moduleName


#Asking the user for a question, any input is fine and will not be used in the program. 
$Question = Read-Host "Ask the Magic 8 Ball a Question"

#Getting answers from YAML file and taking a random answer from the list
$Answers = ConvertFrom-Yaml (get-content "$PSScriptRoot\Magic_8_Ball_Answers.yaml" -Raw) 
$The_Answer = Get-Random -InputObject $Answers

#Carriage return
$crlf = "`r`n"

#Writes the answer to the screen
Write-Host $crlf $The_Answer $crlf