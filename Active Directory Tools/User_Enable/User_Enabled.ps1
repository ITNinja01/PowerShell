<#
.SYNOPSIS
This script will take a list of users from a CSV file and check if they are enabled or disabled in Active Directory. The output will be a list of users with their name and enabled status.
.INPUTS
A CSV file with a list of users. The CSV file should have a column named "UserPrincipalName" with the users' UPNs.
.OUTPUTS
A list of users with their name and enabled status.
.NOTES
Error Codes:
1 - Input file not found
Developer: ITNinja01
Date: 10-02-2026
Version: 2.1.0
#>

$InputFilePath = "$env:USERPROFILE\Downloads\Users.csv"

if (-not (Test-Path $InputFilePath)) {
    Write-Host "Input file not found at $InputFilePath. Please ensure the file exists and try again." -ForegroundColor Red
    LastExitCode = 1
    exit
}

$inputdata = import-csv $InputFilePath

$Report = [System.Collections.Generic.List[object]]::new()

#Creating counting variable to keep track of the number of users processed
$InputDataProgress = $InputData
$Count = $InputDataProgress.Count
$i = 0

$inputdata | ForEach-Object {
    $i++
    $percentage = [math]::Round(($i / $Count) * 100, 2)
    Write-Progress -Activity "Processing Users" -Status "$i of $Count ($percentage%)" -PercentComplete $percentage

    #   $UserPrincipalName = $_.UserPrincipalName. Only need the name and enabled status, so we can get that from the ADUser object and add them to a report object to output at the end of the script.   
    $Name = (Get-ADUser -Filter "UserPrincipalName -eq '$($_.UserPrincipalName)'" | select-object Name).Name
    $Enabled = (Get-ADUser -Filter "UserPrincipalName -eq '$($_.UserPrincipalName)'" | select-object Enabled).Enabled

    $Report.Add([PSCustomObject]@{
            Name    = $Name
            Enabled = $Enabled
        })
}

# Descending to see the disabled users at the bottom since the report can be long. 
write-output $Report | Sort-Object Enabled -Descending