function Get-GradeImageExample {
<#
.SYNOPSIS
Retrieves and displays an example image for the specified coin grade.
.DESCRIPTION
This function retrieves an example image for a specified coin grade from the 'bin' directory and opens it using the default image viewer. It supports various grades and requires that the corresponding image files are named in the format 'coin-grades-<grade>.jpg'.
.COMPONENT
Bin directory containing coin grade images.
.PARAMETER Grade
Specifies the grade of the coin. Valid values are "01", "02", "03", "04", "06", "08", "10", "12", "15", "20", "25", "30", "35", "40", "45", "50", "53", "55", "58", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "Ungradable", "All" or "Info".
.EXAMPLE
Get-GradeImageExample -Grade "65"
.NOTES
Developer: ITNinja01
Date: 05-09-2026   
Version: 1.0.3
#>

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]
        [ValidateSet("01", "02", "03", "04", "06", "08", "10", "12", "15", "20", "25", "30", "35", "40", "45", "50", "53", "55", "58", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "Ungradable")]
        $Grade
    )    
    $ScriptLocation = $PSScriptRoot
    $BinLocation = Join-Path -Path $ScriptLocation -ChildPath "..\bin"
    $CoinExample = Join-Path -Path $BinLocation -ChildPath "coin-grades-$grade.jpg"

    $CoinExample = Resolve-Path -Path $CoinExample
    Start-Process $CoinExample
}