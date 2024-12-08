<#
.SYNOPSIS
This script shows a user is enabled.
#>

#Using CSV to import users into new group 
Import-Csv "$PSScriptRoot\Users.csv" | ForEach-Object {
    Get-ADUser  $_.Username | select name, enabled 
}