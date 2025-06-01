$Food_List = ConvertFrom-Yaml (Get-Content -Path $PSScriptRoot\Food_Target_Data.yaml -Raw)

$Eat = Read-Host -Prompt "What do you want to eat? (Enter a food item)"

$Food_Selection = $Food_List | Where-Object {$_.Nourishment -eq $Eat} | Out-String

if (-not $Food_Selection) {
    Write-Host "Food item not found. Please check the input."
} 
else {
    write-host "You have selected Nourishment: $Food_Selection"
}