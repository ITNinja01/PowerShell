<#
.SYNOPSIS
This script scans a list of IP addresses from a CSV file and checks their connectivity using the Test-Connection cmdlet.
.DESCRIPTION
The script reads IP addresses from a CSV file located in the script's root directory, attempts to ping each address, and logs the results (online/offline status) to an output CSV file in the user's Downloads folder.
.COMPONENT
PowerShell, Networking
.INPUTS
A CSV file named IPs.csv located in the script's root directory containing a column "IPAddress".
.OUTPUTS
A CSV file named IP_Scan_Results.csv in the user's Downloads folder containing the IP address.
.FUNCTIONALITY
Network connectivity testing
#>
$IPAddresses = Import-Csv $PSScriptRoot\IPs.csv

$Count = $IPAddresses.Count
Write-Host "Scanning $Count IP addresses from the input file."

$IPAddresses | ForEach-Object {
    $i++
    $percent = [math]::Round(($i / $Count) * 100, 2)
    Write-Progress -Activity "Scanning IP Addresses" -Status "Processing IP $i of $Count, $percent complete"

    $CurrentIPAddress = $_.IPAddress | Out-String
    Write-Output "Trying to contact to $CurrentIPAddress."
    if (test-connection $_.IPAddress -count 1 -Quiet) {
        $Output = [PSCustomObject]@{
            IPAddress = $_.IPAddress
            Status    = "Online"
            Timestamp = Get-Date
        }
        $Output | Export-Csv -Path $Env:USERPROFILE\Downloads\IP_Scan_Results.csv -NoTypeInformation -Append                     
    }    
}
Get-Content $Env:USERPROFILE\Downloads\IP_Scan_Results.csv