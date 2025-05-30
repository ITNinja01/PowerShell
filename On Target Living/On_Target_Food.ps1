$Food_List = ConvertFrom-Yaml (Get-Content -Path $PSScriptRoot\Food_Target.yaml -Raw)

$Eat = Read-Host -Prompt "What do you want to eat? (Enter a food item)"

try {
    $Food_Selection = $Food_List | Where-Object {$_.Nourishment -eq $Eat}
    Write-Host "Nourishment: $Food_Selection"
 
}
catch {
     Write-Host "Food item not found. Please try again."
}