<#
.SYNOPSIS
Randomly selects a quote from Duke Nukem and speaks it out loud or prints it to the console.
.DESCRIPTION
This script randomly selects a quote from a YAML file containing Duke Nukem quotes and either speaks it out loud using the Windows Speech Synthesizer or prints it to the console if not on Windows.
.LINK
https://gist.github.com/Pvlerick/0765e5c6fc389444380aa44860de96e0#file-quotes-json
.INPUTS
None
.OUTPUTS
A spoken quote or printed quote in the console.
.EXAMPLE
PS> .\Random_Duke_Nukem1.ps1
#>

$Quotes =  ConvertFrom-Yaml (get-content "$PSScriptRoot\Quotes.yaml" -Raw)
$The_Quote = Get-Random -InputObject $Quotes

if ($IsWindows -eq $true ){
   $SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $SpeechSynth.Speak($The_Quote)
} 
else {
# Carriage return
    $crlf = "`r`n"
    Write-Host $crlf $The_Quote $crlf
}