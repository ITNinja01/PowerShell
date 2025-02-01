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

if ($User_Choice -eq 'rock' -and $CPU_Choice -eq 'scissors') {
    Write-Host 'User Wins'
}
elseif ($User_Input -eq 'paper' -and $CPU_Choice -eq 'rock') {
    Write-Host 'User Wins'
}
elseif ($User_Choice -eq 'scissors' -and $CPU_Choice -eq 'paper') {
    Write-Host 'User Wins'
}

if ($User_Input -eq 'scissors' -and $CPU_Choice -eq 'rock') {
    Write-Host 'CPU Wins'
}
elseif ($User_Choice -eq 'rock' -and $CPU_Choice -eq 'paper') {
    Write-Host 'CPU Wins'
}
elseif ($User_Choice -eq 'paper' -and $CPU_Choice -eq 'scissors') {
    Write-Host 'CPU Wins'
}