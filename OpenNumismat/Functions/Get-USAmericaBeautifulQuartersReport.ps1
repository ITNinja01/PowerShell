function Get-USAmericaBeautifulQuartersReport {
    <#
.SYNOPSIS
This function generates a report of America the Beautiful quarters in the user's collection.
.DESCRIPTION
The Get-USAmericaBeautifulQuartersReport function reads a JSON file containing coin data and checks for the presence of quarters from each America the Beautiful series. It then generates a report indicating which quarters are in the user's collection and which are not.
.COMPONENT
OpenNumismat
.EXAMPLE
Get-USAmericaBeautifulQuartersReport
.NOTES
Developer: ITNinja01
Date: 11-14-2026
Version: 1.0.1
#>
   
    Test-JSONConnection

    $USQuarters = 'Acadia National Park',
    'American Memorial Park',
    'American Samoa National Park',
    'Apostle Islands National Lakeshore',
    'Arches National Park',
    'Block Island National Wildlife Refuge',
    'Blue Ridge Parkway',
    'Bombay Hook National Wildlife Refuge',
    'Chaco Culture National Historical Park',
    'Chickasaw National Recreation Area',
    'Cumberland Gap National Historical Park',
    'Cumberland Island National Seashore',
    'Denali National Park',
    'Effigy Mounds National Monument',
    'El Yunque National Forest',
    'Ellis Island National Monument (Statue of Liberty)',
    'Everglades National Park',
    'Fort McHenry National Monument and Historic Shrine',
    'Fort Moultrie (Fort Sumter National Monument)',
    'Frank Church River of No Return Wilderness',
    'Frederick Douglass National Historic Site',
    'George Rogers Clark National Historical Park',
    'Gettysburg National Military Park',
    'Glacier National Park',
    'Grand Canyon National Park',
    'Great Basin National Park',
    'Great Sand Dunes National Park',
    'Great Smoky Mountains National Park',
    'Harpers Ferry National Historical Park',
    'Hawaii Volcanoes National Park',
    'Homestead National Monument of America',
    'Hot Springs National Park',
    'Kisatchie National Forest',
    'Lowell National Historical Park',
    'Marsh-Billings-Rockefeller National Historical Park',
    'Mount Rushmore National  Memorial',
    'Mt. Hood National Forest',
    'National Park of  American Samoa',
    'Olympic National Park',
    'Ozark National Scenic Riverways',
    'Perrys Victory and International Peace Memorial',
    'Pictured Rocks National Lakeshore',
    'Salt River Bay National Historical Park and Ecological Preserve',
    'San Antonio Missions National Historical Park',
    'Saratoga National Historical Park',
    'Shawnee National Forest',
    'Shenandoah National Park',
    'Tallgrass Prairie National Preserve',
    'Theodore Roosevelt National Park',
    'Tuskegee Airmen National Historic Site',
    'Vicksburg National Military Park',
    'Voyageurs National Park',
    'War in the Pacific National Historic Park',
    'Weir Farm National Historic Site',
    'White Mountain National Forest',
    'Yellowstone National Park',
    'Yosemite National Park'

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

    Write-Host "Total America the Beautiful Quarters I have: $Y"
    Write-Host "Total America the Beautiful Quarters I do not have: $N"
    Return $ReportData | sort-object HasQuarter -Descending
} 