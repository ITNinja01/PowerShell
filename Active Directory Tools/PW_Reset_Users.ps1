<#
.SYNOPSIS
This script is for resetting user's password with PSCredential
#>

#Parameter for username being configured. 
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [PSCredential] $Credential
)
#Set users password and -Server maybe needed to communicate with a domain controller (DC).
Set-ADAccountPassword -Identity $Credential.Username -Reset -NewPassword $Credential.Password -ErrorAction Stop -Verbose