<#
.SYNOPSIS
A script to simulate having a bad day by randomly stopping processes and services.
.DESCRIPTION
This PowerShell script prompts the user to decide if they want to "have a bad day." If the user responds with "Y," the script will randomly stop a selection of processes and services on the system, simulating a chaotic day. If the user responds with "N," the script will simply wish them a great day.
.NOTES 
This script is intended for educational and entertainment purposes only. Use with caution, as stopping critical processes or services may lead to system instability.
#>

Read-Host "Do you want to have a bad day? (Y/N)" -OutVariable badDay

if ($badDay -eq "Y") {
# Simulate a bad day by randomly stopping processes
1..10 | Where-Object {$_.processname -notmatch "powershell" -or "pwsh"}  |ForEach-Object {Get-Process | Get-Random | Stop-Process -Force -Verbose}
# Simulate a bad day by randomly stopping services
1..10 | ForEach-Object {Get-Service | Get-Random | Stop-Service -Force -Verbose}
}
else {
    Write-Host "Good choice! Have a great day!" -ForegroundColor Green
}