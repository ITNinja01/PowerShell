<#
.SYNOPSIS 
Simple script to find the file size of a directory.
.NOTES
One day add error checking for file path. 
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory=$true)]
    $Path
)

$Byte_Size = Get-ChildItem -Recurse $path | Measure-Object -Sum Length | Select-Object sum -ExpandProperty sum  

#Math to find size since it only comes in bytes. 
$Mg_Size = $Byte_Size/1000
$Gb_Size = $Byte_Size /1000000

Write-Host "$Path has $Mg_Size MG"
Write-Host "$Path has $Gb_Size GB"