function Get-USSemiquincentennialQuartersReport {
    <#
.SYNOPSIS
This function generates a report of Semiquincentennial quarters in the user's collection.
.DESCRIPTION
The Get-USSemiquincentennialQuartersReport function reads a JSON file containing coin data and checks for the presence of quarters from each Semiquincentennial series. It then generates a report indicating which quarters are in the user's collection and which are not.
.COMPONENT
OpenNumismat
.EXAMPLE
Get-USSemiquincentennialQuartersReport
.NOTES
Developer: ITNinja01
Date: 11-28-2026
Version: 1.2
#>
   
    Test-JSONConnection

    $USQuarters = 'American Revolutionary War',
    'Constitution of the United States',
    'Gettysburg Address',
    'Mayflower Compact',
    'United States Declaration of Independence'

    $ReportData = [System.Collections.Generic.List[Object]]::new()

    $N = 0
    $Y = 0

    if (Test-Path $global:JsonCoins) {
        $Coins = Get-Content -Path  $JsonCoins -raw | ConvertFrom-Json
        
        Foreach ($Coinage in $USQuarters) {
            $Quarter = $Coins.coins | Where-Object { $_.subjectshort -eq $Coinage }
            if ($Quarter) {
                $ReportData.Add([PSCustomObject]@{
                        Coinage    = $Coinage
                        HasQuarter = 'Yes'
                    })
                $Y++
            }
            else {
                $ReportData.Add([PSCustomObject]@{
                        Coinage    = $Coinage
                        HasQuarter = 'No'
                    })
                $N++
            }
        }
    } 

    Write-Host "Total Semiquincentennial Quarters I have: $Y"
    Write-Host "Total Semiquincentennial Quarters I do not have: $N"
    Return $ReportData | Sort-Object -Property @{ Expression = 'HasQuarter'; Descending = $true }, Coinage
} 