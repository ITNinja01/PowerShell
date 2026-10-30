#This script adds sam accounts to a group.
#Param for the group that sam accounts are being added to. 
[CmdletBinding()]
param (
    [Alias('Group_Name')]
    [Parameter(Mandatory = $true)]
    $GroupName
)
#Using CSV to import users into new group 
Import-Csv "$PSScriptRoot\ADGroup_Mems.csv" | ForEach-Object { Add-ADPrincipalGroupMembership -Identity $_.SamAccountName -Memberof $GroupName -Verbose }