#This script adds sam accounts to a group.
#Param for the group that sam accounts are being added to. 
[CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        $Group_Name
        )
#Using CSV to import users into new group 
Import-Csv "$PSScriptRoot\ADGroup_Mems.csv" | ForEach-Object {Add-ADPrincipalGroupMembership -Identity $_.SamAccountName -Memberof $Group_Name -Verbose} 