<#
.SYNOPSIS
This script simplifies checking the file hash for two files.
#>
[CmdletBinding()]
param (
[Parameter(Mandatory)]
$File_Path_1,
[Parameter(Mandatory)]
$File_Path_2,
[Parameter(Mandatory,
HelpMessage = "Please choose 'SHA1','SHA256','SHA384','SHA512','MD5'.")]
[ValidateSet('SHA1','SHA256','SHA384','SHA512','MD5')]
$Hash_Algorithm
)

if ((Test-Path -Path $File_Path_1) -and (Test-Path -Path $File_Path_2)) {
    Write-Host "Confirmed $File_Path_1 exist"
    Write-Host "Confirmed $File_Path_2 exist"
}
else {
    Throw "File path(s) cannot be found."
}

#The hashes must be expanded to a String that it can be validated with the provided hash.
$File_Hash_1 = Get-FileHash -Path $File_Path_1 -Algorithm $Hash_Algorithm | Select-Object Hash -ExpandProperty Hash
$File_Hash_2 = Get-FileHash -Path $File_Path_2 -Algorithm $Hash_Algorithm | Select-Object Hash -ExpandProperty Hash

if ($File_Hash_1 -eq $File_Hash_2) {
    Write-Host "Confirmed the file has not been altered 🤜🤛."
}
else {
    Write-Host "File hashes are not the same. $File_Hash_1 does not equal $File_Hash_2!"
}