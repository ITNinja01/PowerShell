function Test-URL {
    param(
        [Parameter(Mandatory)]
        [string]$TargetName
    )

    Test-Connection -ComputerName $TargetName -Count 1 -Quiet
}
