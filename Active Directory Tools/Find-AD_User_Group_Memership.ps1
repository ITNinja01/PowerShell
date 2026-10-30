<#
.SYNOPSIS
This script will find the group membership for a user and sorting them by the samaccountname.
#>

#Parameter for username being requested. 
[CmdletBinding()]
param(
   
    [Parameter(Mandatory = $true)]
    $UserName
)

#If to look for AD account in domain
$TestUsername = Get-ADUser -Filter { samaccountname -eq $Username } | Select-Object samaccountname -ExpandProperty samaccountname
if ($TestUsername -eq $null) {
    throw "There is no AD account for $Username"
}

$UserFullName = Get-ADUser $Username | Select-Object name -ExpandProperty name
Write-host "$UserFullName is in the following AD groups by samaccountname:"
Get-ADPrincipalGroupMembership $UserName | Select-Object samaccountname | Sort-Object samaccountname 