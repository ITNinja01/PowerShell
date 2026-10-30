#This script adds email addresses to a group.
#Param for the group that mail contacts are being added to. 
[CmdletBinding()]
param (
    [Alias('Group_Name')]
    [Parameter(Mandatory = $true)]
    $GroupName
)
#Using CSV to import users into new group 
Import-Csv '$PSScripRroot\Group_Mems.csv' | ForEach-Object { Add-DistributionGroupMember -Identity $GroupName -Member $_.Email_Address }