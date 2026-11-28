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
Date: 11-28-2026
Version: 1.1.0
#>

Test-JSONConnection

    $USQuarters = 'Althea Gibson',
    'Anna May Wong',
    'Bessie Coleman',
    'Celia Cruz',
    'Dr. Mary Edwards Walker',
    'Dr. Pauli Murray',
    'Dr. Sally Ride',
    'Dr. Vera Rubin',
    'Edith Kanakaʻole',
    'Eleanor Roosevelt',
    'Ida B. Wells',
    'Jovita Idar',
    'Juliette Gordon Low',
    'Maria Tallchief',
    'Maya Angelou',
    'Nina Otero-Warren',
    'Patsy Mink',
    'Stacey Milbern',
    'Wilma Mankiller',
    'Zitkala-Sa'

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
    Return $ReportData | Sort-Object -Property @{ Expression = 'HasQuarter'; Descending = $true }, Coinage
} 