<#
.SYNOPSIS
This script is for scanning a set of IP using the test-connection cmdlet.
#>

$Answer = Read-Host -Prompt "Write output in (f)ile or in (t)erminal?"

if ($Answer -eq 'f') {
    Import-Csv $PSScriptRoot\IPs.csv | ForEach-Object {
        test-connection $_.IP_Address -Count 1 | Select-Object Address, Status | Export-Csv -Path "$PSScriptRoot\Output.csv" -Append
        Write-Host "Testing $_.IP_Address"
    }
}
elseif ($Answer -eq 't') {
    Import-Csv $PSScriptRoot\IPs.csv | ForEach-Object {
        test-connection $_.IP_Address -Count 1 
    }
}