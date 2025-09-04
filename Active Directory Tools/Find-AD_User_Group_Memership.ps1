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
$Test_Username = Get-ADUser -Filter { samaccountname -eq $Username } | Select-Object samaccountname -ExpandProperty samaccountname
if ($Test_Username -eq $null) {
    throw "There is no AD account for $Username"
}

$User_FullName = Get-ADUser $Username | Select-Object name -ExpandProperty name
Write-host "$User_FullName is in the following AD groups by samaccountname:"
Get-ADPrincipalGroupMembership $UserName | Select-Object samaccountname | Sort-Object samaccountname 