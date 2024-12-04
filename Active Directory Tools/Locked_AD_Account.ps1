<#
.SYNOPSIS
This script unlocks an AD account if it is locked. 
#>

[CmdletBinding()]
#Parameter for username being configured.
param ([Parameter(Mandatory = $true)]
    $Username,
    [switch] $unlock
)
$Lock_State = Get-ADUser $Username -Properties * | Select-Object lockedout -ExpandProperty lockedout
If (-not $Lock_State) {
    Write-Error "$Username is not locked out." -ErrorAction Stop 
}
If ($unlock) {
    Unlock-ADAccount -Identity $Username -Verbose
}