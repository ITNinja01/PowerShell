function Get-USAmericanWomenQuartersReport {
    <#
.SYNOPSIS
This function generates a report of American Women quarters in the user's collection.
.DESCRIPTION
The Get-USAmericanWomenQuartersReport function reads a JSON file containing coin data and checks for the presence of quarters from each American Women series. It then generates a report indicating which quarters are in the user's collection and which are not.
.COMPONENT
OpenNumismat
.EXAMPLE
Get-USAmericanWomenQuartersReport
.NOTES
Developer: ITNinja01
Date: 11-12-2026
Version: 1.0.0
#>

Test-JSONConnection

    $USQuarters = 'Maya Angelou',
    'Dr. Sally Ride',
    'Wilma Mankiller',
    'Nina Otero-Warren',
    'Anna May Wong',
    'Bessie Coleman',
    'Edith Kanakaʻole',
    'Eleanor Roosevelt',
    'Jovita Idar',
    'Maria Tallchief',
    'Dr. Pauli Murray',
    'Patsy Mink',
    'Dr. Mary Edwards Walker',
    'Celia Cruz',
    'Zitkala-Sa',
    'Ida B. Wells',
    'Juliette Gordon Low',
    'Dr. Vera Rubin	',
    'Stacey Milbern'
    'Althea Gibson'

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
    
    Write-Host "Total American Women Quarters I have: $Y"
    Write-Host "Total American Women Quarters I do not have: $N"
    Return $ReportData | sort-object HasQuarter -Descending
} 