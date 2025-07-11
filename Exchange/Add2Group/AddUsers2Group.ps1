#This script adds email addresses to a group.
#Param for the group that mail contacts are being added to. 
[CmdletBinding()]
    param (
        [Parameter(Mandatory=$true)]
        $Group_Name
        )
#Using CSV to import users into new group 
Import-Csv '$PSScripRroot\Group_Mems.csv'| ForEach-Object {Add-DistributionGroupMember -Identity $Group_Name -Member $_.Email_Address}