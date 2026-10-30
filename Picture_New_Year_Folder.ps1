<#
.SYNOPSIS
This script is for creating new folders for my pictures every year.
.DESCRIPTION
I use this script at the beginning of every year to Organize my pictures.
#>

$FolderPath = Read-Host -Prompt "Type in the folder path to store this years pictures"

#Make sures the folder path exist before executing.
if (Test-Path $FolderPath) {
    Write-Host "Confirmed the path of $FolderPath"
}
else {
    Throw "Folder path cannot be found"
}

#Creates top/year folder
$NewYearFolder = get-date -Format yyyy
New-Item -ItemType directory  "$FolderPath\$NewYearFolder" -Verbose

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
    New-Item -ItemType directory "$FolderPath\$NewYearFolder\$Month" -Verbose
}