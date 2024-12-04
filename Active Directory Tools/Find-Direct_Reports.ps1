<#
.SYNOPSIS
This scripts finds and displays direct reports of a person based off the "directreports" property.
#>

#Parameter for username being requested. 
 [CmdletBinding()]
param(  
    [Parameter(Mandatory=$true)]
    $UserName  
)

#If to look for AD account in domain
$Test_Username = Get-ADUser -Filter {samaccountname -eq $Username } | select samaccountname -ExpandProperty samaccountname
if ($Test_Username -eq $null) {
    throw "There is no AD account for $Username"
}

Get-ADUser $UserName -Properties * | select directreports -ExpandProperty directreports | Get-ADUser -Properties * | Select-Object name, office, officephone, title  