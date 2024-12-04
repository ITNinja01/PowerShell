<#
.SYNOPSIS
This script adds users to a AD group(s).
#>

#Using CSV to import users into new group 
Import-Csv "$PSScriptRoot\Add_Users.csv" | ForEach-Object {
    Add-ADPrincipalGroupMembership -Identity $_.Username -Member $_.Group_Name -ErrorAction SilentlyContinue -Verbose
    Write-Host $_.Username added to $_.Group_Name
} 