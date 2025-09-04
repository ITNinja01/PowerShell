<#
.SYNOPSIS
This script allows the user to look up food items from a YAML file containing a list of foods and their nourishment values.
.DESCRIPTION
This PowerShell script reads a YAML file containing food items and their nourishment values, prompts the user to enter a food item, and checks if that item exists in the list. If found, it displays the selected food item; otherwise, it informs the user that the item was not found.
.COMPONENT
On Target Living Food Lookup
.LINK
https://ontargetliving.com/products/food-target

https://cdn.shopify.com/s/files/1/0019/0460/7267/files/Food_Target_2022.pdf?v=1657654806
#>

#Ensure the required module is installed
$moduleName = 'powershell-yaml'
if (-not (Get-Module -ListAvailable -Name $moduleName)) {
    try {
        Install-Module -Name $moduleName -Scope CurrentUser -Force -ErrorAction Stop -Verbose
    }
    catch {
        Write-Error "Could not install module '$moduleName'. Please install it manually."
        exit 1
    }
}
Import-Module $moduleName

#Load the YAML file containing food items and their nourishment values
$Food_List = ConvertFrom-Yaml (Get-Content -Path $PSScriptRoot\Food_Target_Data.yaml -Raw)

#Prompt the user for a food item and search the list. Have to use Out-String to convert the hashtable object to a string for display.
$Eat = Read-Host -Prompt "What do you want to eat? (Enter a food item)"
$Food_Selection = $Food_List | Where-Object { $_.Nourishment -eq $Eat } | Out-String 

#Check if the food item exists in the list
if (-not $Food_Selection) {
    Write-Host "Food item not found. Please check the input."
    #Suggest similar food items based on the input
    $Possible_Foods = $Food_List | Where-Object { $_.Nourishment -like "*$Eat*" } | Select-Object Nourishment | Out-String
    #Only display if possible matches are found       
    if ($Possible_Foods) {
        Write-Host "Found possible matches: $Possible_Foods"
    }
}
else {  
    write-host "You have selected Nourishment: $Food_Selection"
}