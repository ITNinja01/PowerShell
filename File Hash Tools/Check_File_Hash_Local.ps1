<#
.SYNOPSIS
This script simplifies checking the file hash for two files.
#>
[CmdletBinding()]
param (
    [Alias('File_Path_1')]
    [Parameter(Mandatory)]
    $FilePath1,
    [Alias('File_Path_2')]
    [Parameter(Mandatory)]
    $FilePath2,
    [Alias('Hash_Algorithm')]
    [Parameter(Mandatory,
        HelpMessage = "Please choose 'SHA1','SHA256','SHA384','SHA512','MD5'.")]
    [ValidateSet('SHA1', 'SHA256', 'SHA384', 'SHA512', 'MD5')]
    $HashAlgorithm
)

if ((Test-Path -Path $FilePath1) -and (Test-Path -Path $FilePath2)) {
    Write-Host "Confirmed $FilePath1 exist"
    Write-Host "Confirmed $FilePath2 exist"
}
else {
    Throw "File path(s) cannot be found."
}

#The hashes must be expanded to a String that it can be validated with the provided hash.
$FileHash1 = Get-FileHash -Path $FilePath1 -Algorithm $HashAlgorithm | Select-Object Hash -ExpandProperty Hash
$FileHash2 = Get-FileHash -Path $FilePath2 -Algorithm $HashAlgorithm | Select-Object Hash -ExpandProperty Hash

if ($FileHash1 -eq $FileHash2) {
    Write-Host "Confirmed the file has not been altered 🤜🤛."
}
else {
    Write-Host "File hashes are not the same. $FileHash1 does not equal $FileHash2!"
}