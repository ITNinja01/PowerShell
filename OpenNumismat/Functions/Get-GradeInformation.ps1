<#
.SYNOPSIS
Retrieves coin grading information based on the specified grade.
.DESCRIPTION
This function retrieves coin grading information from a YAML file based on the specified grade. It supports various grades and can return all grades or specific information about a grade.
The function requires the 'powershell-yaml' module to parse the YAML file containing the grading
.COMPONENT
YAML file containing coin grading standards.
.PARAMETER Grade
Specifies the grade of the coin. Valid values are "01", "02", "03", "04", "06", "08", "10", "12", "15", "20", "25", "30", "35", "40", "45", "50", "53", "55", "58", "60", "61", "62", "63", "64", "65", "66", "67", "68", "69", "70", "Ungradable", "All" or "Info".
.EXAMPLE
Get-GradeInformation -Grade "65"
.NOTES
Developer: ITNinja01
Date: 09-03-2025   
Version: 1.0.1
#>

function Get-GradeInformation {
[CmdletBinding()]
param(
[Parameter(Mandatory)]
    [string]
    [ValidateSet("01","02","03","04","06","08","10","12","15","20","25","30","35","40","45","50","53","55","58","60","61","62","63","64","65","66","67","68","69","70","Ungradable","All","Info")]
    $Grade
)    

#Ensure the required module is installed
$moduleName = 'powershell-yaml'
if (-not (Get-Module -ListAvailable -Name $moduleName)) {
    try {
        Install-Module -Name $moduleName -Scope CurrentUser -Force -ErrorAction Stop -Verbose
    } catch {
        Write-Error "Could not install module '$moduleName'. Please install it manually."
        exit 1
    }
}
Import-Module $moduleName

$Grade_Data = ConvertFrom-Yaml (Get-Content -Path $PSScriptRoot\Coin_Grading_Standards.YAML -Raw)

if ($Grade -eq 'all') {
    $Grade_Data | Where-Object {$_.Grade -like "*"} | select name, grade, Description 
}
elseif ($Grade -eq 'info') {
    $Grade_Data | Where-Object {$_.Link -like "htt*"}
}     
else {
    $Grade_Data | Where-Object {$_.Grade -eq "$Grade"} 
}
}