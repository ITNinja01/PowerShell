# Python Executtable Definition
$Python = "$Env:LOCALAPPDATA\Programs\Python\Python314\python.exe"

# Python script that I wish to exexute
$Script = "$PSScriptRoot\PS_Passing_Python.py"

Write-Host "Pass a string to Python script"
$Message = "Hello from PowerShell"

Write-Host 
$Message | & $Python $Script    