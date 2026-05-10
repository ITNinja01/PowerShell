function Get-USStatesQuartersReport {
    <#
.SYNOPSIS
This function generates a report of US states quarters in the user's collection.
.DESCRIPTION
The Get-USStatesQuartersReport function reads a JSON file containing coin data and checks for the presence of quarters from each US state. It then generates a report indicating which states' quarters are in the user's collection and which are not.
.COMPONENT
OpenNumismat
.EXAMPLE
Get-USStatesQuartersReport
.NOTES
Developer: ITNinja01
Date: 05-09-2026
Version: 1.0.0
#>
   

    if ($global:JsonCoins -eq $null) {
        $global:JsonCoins = Read-Host -Prompt "Type in the file path for the Open Numismat exported .JSON file?"
    }

    $USStates = "Alabama",
    "Alaska",
    "Arizona",
    "Arkansas",
    "California",
    "Colorado",
    "Connecticut",
    "Delaware",
    "Florida",
    "Georgia",
    "Hawaii",
    "Idaho",
    "Illinois",
    "Indiana",
    "Iowa",
    "Kansas",
    "Kentucky",
    "Louisiana",
    "Maine",
    "Maryland",
    "Massachusetts",
    "Michigan",
    "Minnesota",
    "Mississippi",
    "Missouri",
    "Montana",
    "Nebraska",
    "Nevada",
    "New Hampshire",
    "New Jersey",
    "New Mexico",
    "New York",
    "North Carolina",
    "North Dakota",
    "Ohio",
    "Oklahoma",
    "Oregon",
    "Pennsylvania",
    "Rhode Island",
    "South Carolina",
    "South Dakota",
    "Tennessee",
    "Texas",
    "Utah",
    "Vermont",
    "Virginia",
    "Washington", 
    "West Virginia", 
    "Wisconsin", 
    "Wyoming"

    $ReportData = [System.Collections.Generic.List[Object]]::new()

    $N = 0
    $Y = 0

    if (Test-Path $global:JsonCoins) {
        $Coins = Get-Content -Path  $JsonCoins -raw | ConvertFrom-Json
        
        Foreach ($State in $USStates) {
            $Quarter = $Coins.coins | Where-Object { $_.subjectshort -eq $State }
            if ($Quarter) {
                $ReportData.Add([PSCustomObject]@{
                        State      = $State
                        HasQuarter = 'Yes'
                    })
                $Y++
            }
        else {
            $ReportData.Add([PSCustomObject]@{
                    State      = $State
                    HasQuarter = 'No'
                })
            $N++
        }
        }
    } 
    Write-Host "Total States with Quarters I have: $Y"
    Write-Host "Total States with Quarters I do not have: $N"
    Return $ReportData | sort-object HasQuarter -Descending
} 