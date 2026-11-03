<#
.SYNOPSIS
This script scans a list of DNS records from a CSV file and checks their resolution using the Resolve-DnsName cmdlet.
.DESCRIPTION
The script reads DNS records from a CSV file located in the user's Downloads folder, attempts to resolve each record, and logs the results (resolved IP or failure) to an output CSV file in the user's Downloads folder.

A example of the input CSV file (IPs.csv) format is in $PSScriptRoot folder. 
.FUNCTIONALITY
DNS resolution testing
.COMPONENT
PowerShell, Networking, DNS
.INPUTS
A CSV file named DNS_Records.csv located in the user's Downloads folder containing a column "A Record".
.OUTPUTS
A CSV file named DNS_Resolver_Report_<current date and time>.csv in the user's Downloads folder containing the DNS record and its resolved IP address or a message indicating it could not be resolved.
.NOTES
Developer: ITNina01
Date: 11-03-2026
Version: 2.1.0
#>

$DNSRecords = Import-Csv -Path "$env:USERPROFILE\Downloads\DNS_Records.csv"

$Count = $DNSRecords.Count
Write-Host "Scanning $Count DNS records from the input file."
$i = 0

$Report = [System.Collections.Generic.List[object]]::new()

foreach ($Record in $DNSRecords) {
    $i++
    $percent = [math]::Round(($i / $Count) * 100, 2)
    Write-Progress -Activity "Scanning DNS Records" -Status "Processing record $i of $Count, $percent complete"

    if (Resolve-DnsName -Name $Record.'A Record' -erroraction SilentlyContinue) {
        $Report += [PSCustomObject]@{
            'A Record'    = $Record.'A Record'
            'Resolved IP' = (Resolve-DnsName -Name $Record.'A Record').IPAddress
        }
        Write-Host "$Record.'A Record' resolved successfully."
    }
    else {
        Write-Host "Record $Record.'A Record' could not be resolved." -ForegroundColor Red
        $Report += [PSCustomObject]@{
            'A Record'    = $Record.'A Record'
            'Resolved IP' = 'Could not resolve'
        }
    } 
}

write-output $Report
$CurrentDate = get-date -Format MM-dd-yyyy-h-m-s
$Report | Export-Csv -Path "$env:USERPROFILE\Downloads\DNS_Resolver_Report_$CurrentDate.csv" -NoTypeInformation