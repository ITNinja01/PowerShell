$User_Input = Read-Host -Prompt "Please choose the first letter for (R)ock, (P)aper or (S)cissors?"

if ($User_Input -eq 'r') {
    $User_Choice = 'rock'
}
elseif ($User_Input -eq 'p') {
    $User_Choice = 'paper' 
}
elseif ($User_Input -eq 's') {
    $User_Choice = 'scissors'
}
else {
    Write-Host 'Please only choose the first letter for (R)ock, (P)aper or (S)cissors.'
}

$CPU_Choice = Get-Random 'rock', 'paper', 'scissors'

if ($User_Choice -eq $CPU_Choice) {
    Write-Host "There is a tie between $User_Choice and $CPU_Choice!" 
} 
