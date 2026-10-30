<#
.SYNOPSIS
This script simplifies checking the file hash if the file hash is already known.
#>
[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    [Alias('File_Path')]
    $FilePath,
    [Parameter(Mandatory)]
    [Alias('Provided_Hash')]
    $ProvidedHash,
    [Parameter(Mandatory)]
    [ValidateSet('SHA1', 'SHA256', 'SHA384', 'SHA512', 'MD5')]
    [Alias('Hash_Algorithm')]
    $HashAlgorithm
)

if (Test-Path -Path $FilePath) {
    Write-Host "Confirmed $FilePath exist"
}
else {
    Throw "File path cannot be found."
}

#The hash must be expanded to a String that it can be validated with the provided hash.
$FileHash = Get-FileHash -Path $FilePath -Algorithm $HashAlgorithm | Select-Object Hash -ExpandProperty Hash

if ($FileHash -eq $ProvidedHash) {
    Write-Host "Confirmed the file has not been altered 🤜🤛."
}
else {
    Write-Host "File hashes are not the same. $FileHash does not equal $ProvidedHash!"
}