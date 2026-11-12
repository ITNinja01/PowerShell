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
Date: 11-12-2026
Version: 1.0.0
#>
   
    Test-JSONConnection

    $USQuarters = 'Hot Springs National Park', 
    'Yellowstone National Park',  
    'Yosemite National Park', 
    'Grand Canyon National Park', 
    'Mt. Hood National Forest',
    'Gettysburg National Military Park', 
    'Glacier National Park',  
    'Olympic National Park',  
    'Vicksburg National Military Park', 
    'Chickasaw National Recreation Area',
    'El Yunque National Forest', 
    'Chaco Culture National Historical Park',
    'Acadia National Park',  
    'Hawaii Volcanoes National Park', 
    'Denali National Park', 
    'White Mountain National Forest', 
    'Perrys Victory and International Peace Memorial',  
    'Great Basin National Park',  
    'Fort McHenry National Monument and Historic Shrine',
    'Mount Rushmore National  Memorial',  
    'Great Smoky Mountains National Park', 
    'Shenandoah National Park', 
    'Arches National Park',  
    'Great Sand Dunes National Park', 
    'Everglades National Park',
    'Homestead National Monument of America',
    'Kisatchie National Forest', 
    'Blue Ridge Parkway',  
    'Bombay Hook National Wildlife Refuge', 
    'Saratoga National Historical Park',	
    'Shawnee National Forest',
    'Cumberland Gap National Historical Park',
    'Harpers Ferry National Historical Park', 
    'Theodore Roosevelt National Park', 
    'Fort Moultrie (Fort Sumter National Monument)', 
    'Effigy Mounds National Monument', 
    'Frederick Douglass National Historic Site', 
    'Ozark National Scenic Riverways', 
    'Ellis Island National Monument (Statue of Liberty)',
    'George Rogers Clark National Historical Park',
    'Pictured Rocks National Lakeshore', 
    'Apostle Islands National Lakeshore', 
    'Voyageurs National Park',  
    'Cumberland Island National Seashore', 
    'Block Island National Wildlife Refuge',  
    'Lowell National Historical Park', 
    'American Memorial Park', 
    'War in the Pacifi c National Historic Park',
    'San Antonio Missions National Historical Park',
    'Frank Church River of No Return Wilderness',
    'National Park of  American Samoa',
    'Weir Farm National Historic Site',
    'Salt River Bay National Historical Park and Ecological Preserve',
    'Marsh-Billings-Rockefeller National Historical Park',
    'Tallgrass Prairie National Preserve',
    'Tuskegee Airmen National Historic Site'

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