<#
.SYNOPSIS
This script simplifies checking the file hash.
#>
[CmdletBinding()]
param (
[Parameter(Mandatory)]
$File_Path,
[Parameter(Mandatory)]
$Provided_Hash,
[Parameter(Mandatory)]
[ValidateSet('SHA1','SHA256','SHA384','SHA512','MD5')]
$Hash_Algorithm
)

if (Test-Path -Path $File_Path) {
    Write-Host "Confirmed $File_Path exist"
}
else {
    Throw "File path cannot be found."
}

#The hash must be expanded to a String that it can be validated with the provided hash.
$File_Hash = Get-FileHash -Path $File_Path -Algorithm $Hash_Algorithm | Select-Object Hash -ExpandProperty Hash

if ($File_Hash -eq $Provided_Hash) {
    Write-Host "Confirmed the file has not been altered 🤜🤛."
}
else {
    Write-Host "File hashes are not the same. $File_Hash does not equal $Provided_Hash!"
}