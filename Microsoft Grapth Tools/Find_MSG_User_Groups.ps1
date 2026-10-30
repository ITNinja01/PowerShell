<#
.SYNOPSIS
This script will get the MS UserID and user it to find Microsoft Graph group membership for a user.
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    $Username
)

$MSGUserID = Get-MgUser -Filter "UserPrincipalName eq '$username@domain.com'" | Select-Object ID -ExpandProperty ID

Get-MgUserMemberOf -UserId $MSGUserID | Select-Object Id -ExpandProperty Id | ForEach-Object { Get-MgGroup -GroupId $_ } | Select-Object DisplayName | Sort-Object DisplayName