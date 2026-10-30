<#.
.SYNOPSIS
Updates the info property of an AD account but preserves the original information.
#>

#Comment is what was change in the account
[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    $Username,
    [Parameter(Mandatory = $true)]
    $Comment
)

#carriage return, needed so everything does not end up on one line.        
$crlf = "`r`n"

#Stores variable for the Properties of org. info
$InfoOrg = Get-ADUser $Username -Properties Info | Select-Object -ExpandProperty Info

#Creates the dates
$InfoMod = "{0:MM/dd/yyyy} Account Modified" -f (Get-Date)

#Adds all of the changes together
$InfoNew = $Comment + $crlf + $InfoMod + $crlf + $InfoOrg

#Sets info with $InfoNew
Set-ADUser $Username -Replace @{Info = $InfoNew } -Verbose  -PassThru | Select-Object DistinguishedName, SID