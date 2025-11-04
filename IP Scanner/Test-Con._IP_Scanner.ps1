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

    # Need to convert to string to avoid duplicate information int terminal.    
    $CurrentIPAddress = $_.IPAddress | Out-String
    Write-Output "Trying to contact to $CurrentIPAddress."

    # Add -Quiet to return boolean value for if the IP is online or not.   
    if (test-connection $_.IPAddress -count 1 -Quiet) {

        # If online, create PS custom object with status online and export to CSV.        
       
        $Output = [PSCustomObject]@{
            IPAddress = $_.IPAddress
            Status    = "Online"
            Timestamp = Get-Date
        }
        $Output | Export-Csv -Path $Env:USERPROFILE\Downloads\IP_Scan_Results.csv -NoTypeInformation -Append                     
    }    
}

Write-Output "IP scan complete. Results saved to IP_Scan_Results.csv in your Downloads folder."
Get-Content $Env:USERPROFILE\Downloads\IP_Scan_Results.csv