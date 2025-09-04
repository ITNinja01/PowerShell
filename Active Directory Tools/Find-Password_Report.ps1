<#
.SYNOPSIS
This scripts shows the properties of an AD user that describes the password and logged me states.
.NOTES
This script was written a long time ago. Today, I would have included net user info and be more specific with a filter in the last line.
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

Get-ADUser $UserName -Properties * | Select-Object name, Enabled, AccountExpirationDate, last*, lockedout, pass*