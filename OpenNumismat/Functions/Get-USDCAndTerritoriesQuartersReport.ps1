function Get-USDCAndTerritoriesQuartersReport {
    <#
.SYNOPSIS
This function generates a report of DC and U.S. Territories quarters in the user's collection.
.DESCRIPTION
The Get-USDCAndTerritoriesQuartersReport function reads a JSON file containing coin data and checks for the presence of quarters from each DC and U.S. Territories series. It then generates a report indicating which quarters are in the user's collection and which are not.
.COMPONENT
OpenNumismat
.EXAMPLE
Get-USDCAndTerritoriesQuartersReport
.NOTES
Developer: ITNinja01
Date: 11-28-2026
Version: 1.1.0
#>
   
    Test-JSONConnection

    $USQuarters = 'District of Columbia',
    'Puerto Rico',
    'Guam',
    'American Samoa',
    'U.S. Virgin Islands',
    'Northern Mariana Islands'


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

    Write-Host "Total DC and U.S. Territories Quarters I have: $Y"
    Write-Host "Total DC and U.S. Territories Quarters I do not have: $N"
    Return $ReportData | Sort-Object -Property @{ Expression = 'HasQuarter'; Descending = $true }, Coinage
} 