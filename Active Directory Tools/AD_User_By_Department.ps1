<#
.SYNOPSIS
This script retrieves Active Directory users by department and exports their details to a CSV file.
.DESCRIPTION
This PowerShell script connects to Active Directory, checks for users in a specified department, and exports their details such as name, office, office phone, user principal name, extension attribute, and title to a CSV file. The CSV file is saved in the user's Downloads folder with a timestamp.
.INPUTS
This script requires the Active Directory module to be installed and available in the PowerShell session. It also requires the user to have permissions to read user properties in Active Directory.
.OUTPUTS
A CSV file containing user details from the specified department.   
.PARAMETER Department
The department for which to retrieve users. This parameter is mandatory.
.EXAMPLE
.\AD_User_By_Department.ps1 -Department "Sales"
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidateNotNullOrEmpty()]
    [string]$Department
)

Import-Module ActiveDirectory

#Checks if the department parameter is a department in Active Directory.
$Deparament_Check = Get-ADUser -Filter 'department -eq $department' -Properties department 
if ($null -eq $Deparament_Check) {
    Write-Host "No users found in the specified department: $Department" -ForegroundColor Red
    exit 1
}

$Date = Get-Date -Format "MM-dd-yyyy"
$CSV = "$department $Date.csv"

#Export the users to a CSV file in the user's Downloads folder.
Get-ADUser -Filter 'department -eq $Department' -Properties office, extensionAttribute7, officephone, title  | select name, office, officephone, UserPrincipalName, extensionAttribute7, title | sort name | Export-Csv -Path $env:USERPROFILE\Downloads\$CSV -Verbose