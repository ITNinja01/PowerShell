<#
.SYNOPSIS
This script will get the MS UserID and user it to find Microsoft Graph group membership for a user.
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    $Username
)

$MSG_User_ID = Get-MgUser -Filter "UserPrincipalName eq '$username@domain.com'" | Select ID -ExpandProperty ID

Get-MgUserMemberOf -UserId $MSG_User_ID | select Id -ExpandProperty Id | foreach {Get-MgGroup -GroupId $_} | select DisplayName | sort DisplayName