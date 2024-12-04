<#.
.SYNOPSIS
Updates the info property of an AD account but preserves the original information.
#>

#Comment is what was change in the account
[CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        $Username,
        [Parameter(Mandatory=$true)]
        $Comment
        )


#carriage return, needed so everything does not end up on one line.        
$crlf = "`r`n"

#Stores variable for the Properties of org. info
$info_org = Get-ADUser $Username -Properties Info | select -ExpandProperty Info

#Creates the dates
$info_mod= "{0:MM/dd/yyyy} Account Modified" -f (Get-Date)

#Adds all of the changes together
$info_new = $Comment + $crlf + $info_mod + $crlf + $info_org

#Sets info with $info_new
Set-ADUser $Username -Replace @{Info=$info_new} -Verbose  -PassThru | select DistinguishedName, SID