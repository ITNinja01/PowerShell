<#
.SYNOPSIS
This script is for creating new folders for my pictures every year.
.DESCRIPTION
I use this script at the beginning of every year to Organize my pictures.
#>

$Folder_Path = Read-Host -Prompt "Type in the folder path to store this years pictures"

#Make sures the folder path exist before executing.
if (Test-Path $Folder_Path) {
    Write-Host "Confirmed the path of $Folder_Path"
}
else {
    Throw "Folder path cannot be found"
}

#Creates top/year folder
$New_Year_Folder = get-date -Format yyyy
New-Item -ItemType directory  "$Folder_Path\$New_Year_Folder" -Verbose

#Arry for each month
$Months = @(
    '01',
    '02',
    '03',
    '04',
    '05',
    '06',
    '07',
    '08',
    '09',
    '10',
    '11',
    '12'
)

#Creates a folder for each month using array above
foreach ($Month in $Months ) {
    New-Item -ItemType directory "$Folder_Path\$New_Year_Folder\$Month" -Verbose
}