<#
.SYNOPSIS
This script will find the direct reports of a person using the Microsoft Graph.
#>

[CmdletBinding()]
param (
   [Parameter (Mandatory)]
   $username
)

$MSG_User_ID = Get-MgUser -Filter "UserPrincipalName eq '$username@domain.com'" | Select-Object id -ExpandProperty id

#Uses the managers user ID to find the direct reports. Pipes the output to Get-MgUser for usefule information to admin
Get-MgUserDirectReport -UserId $MSG_User_ID | Select-Object id -ExpandProperty id | ForEach-Object { Get-MgUser -UserId $_ } | Format-Table DisplayName, UserPrincipalName, jobtitle, BusinessPhones, officelocation