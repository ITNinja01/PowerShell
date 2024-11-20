<#
.SYNOPSIS
A quick example of how to use PowerShell with the built-in speech synthesizer in Windows.
#>
$Name = Read-Host -Prompt "What is your name?"
$SpeechSynth = New-Object System.Speech.Synthesis.SpeechSynthesizer
$SpeechSynth.Speak("Hello, $Name")