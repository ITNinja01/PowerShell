<#
.SYNOPSIS 
Simple script to find the file size of a directory.
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory)]
    $Path
)

if (-not (Test-Path -Path $Path -PathType Container)) {
    Write-Error "The specified path '$Path' does not exist or is not a directory."
    $LASTEXITCODE = 1
    Exit 
}

$ByteSize = (Get-ChildItem -Recurse $path | Measure-Object -Property Length -Sum).Sum

#Math to find size since it only comes in bytes. 
$KbSize = $ByteSize / 1KB
$MgSize = $ByteSize / 1MB
$GbSize = $ByteSize / 1GB

Write-Host "$Path has $ByteSize bytes of data"
Write-Host "$Path has $KbSize Kb of data"
Write-Host "$Path has $MgSize Mg of data"
Write-Host "$Path has $GbSize Gb of data"