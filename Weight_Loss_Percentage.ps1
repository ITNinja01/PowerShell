$Starting_Weight = Read-Host -Prompt "What is your starting weight?"
$Current_Weight = Read-Host -Prompt "What is your current weight?"

(($Current_Weight/$Starting_Weight)-1)*-1*100