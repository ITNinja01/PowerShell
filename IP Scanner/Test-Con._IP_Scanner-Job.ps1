<#
.SYNOPSIS
This script is for scanning a set of IP using the test-connection cmdlet as a job.
#>

Start-Job -ScriptBlock {Import-Csv $PSScriptRoot\IPs.csv | ForEach-Object {test-connection $_.IP_Address -Count 1 | Select-Object Address,Status | Export-Csv -Path "$PSScriptRoot\Output.csv" -Append}}