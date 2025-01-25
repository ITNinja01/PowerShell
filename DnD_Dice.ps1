<#
.SYNOPSIS
This script emulates a Dungeons & Dragons dice being rolled.
.NOTES
Recommendation from a colleague was to add ASCII art with a role and have 20 be a dragon.
#>

[CmdletBinding()]   
    param (
        [Parameter(Mandatory)]
        [ValidateSet("d4","d6","d8","d10","d12","d20")]
        $Die  
    )

#ASCII art of die faces from ChatGPT to use when the die is rolled. 
$Die_Face_1 = @"
         _______
       /       /\ 
      /  x    /  \
     /_______/    \
    /       \      \
   /   1     \______\
  /___________\      
"@  
$Die_Face_2 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   2     \______\
  /___________\      
"@  
$Die_Face_3 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   3     \______\
  /___________\      
"@  
$Die_Face_4 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   4     \______\
  /___________\      
"@  
$Die_Face_5 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   5     \______\
  /___________\      
"@  
$Die_Face_6 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   6     \______\
  /___________\      
"@  
$Die_Face_7 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   7     \______\
  /___________\      
"@  
$Die_Face_8 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   8     \______\
  /___________\      
"@ 
$Die_Face_9 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   9     \______\
  /___________\      
"@   
$Die_Face_10 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   10    \______\
  /___________\      
"@  
$Die_Face_11 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  11     \______\
  /___________\      
"@  
$Die_Face_12 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   12    \______\
  /___________\      
"@  
$Die_Face_13 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  13     \______\
  /___________\      
"@  
$Die_Face_14 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  14     \______\
  /___________\      
"@  
$Die_Face_15 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  15     \______\
  /___________\      
"@  
$Die_Face_16 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  16     \______\
  /___________\      
"@  
$Die_Face_17 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  17     \______\
  /___________\      
"@  
$Die_Face_18 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   18    \______\
  /___________\      
"@  
$Die_Face_19 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   19    \______\
  /___________\      
"@  
$Die_Face_20 = @"
                              ___====-_  _-====___
                           _--^^^#####//      \\#####^^^--_
                        _-^##########// ( 20!) \\##########^-_
                       -############//  |\^^/|  \\############-
                     _/############//   (@::@)   \\############\_
                    /#############((     \\//     ))#############\
                   -###############\\    (oo)    //###############-
                  -#################\\  / UUU \  //#################-
                 -###################\\/  (   )  \/###################-
                _/|##########/\######(    (   )    )######/\##########|\_
               / |#/\#/\#/\/  \#/\###(   (     )   )###/\#/  \/\#/\#/\| \
              (  (  (  (    (    )  (  (     )  )  )    )  )  )  )  )
              \  \  \  \    (    )   ( ( (   )  )  )   )    )  )  )  /
               \  \  \  \   (    )  (  ( (   )  )  )   )    )  )  )  /
                \  \  \  \  (   )  (   (  (   )   )   )    )  )  )  /
                 \  \  \  \ (   )  (    ( (  )  )   )    )  )  )  /
                  \  \  \  \ (   ) (    (  (  ) )  )    )  )  )  /
                   \  \  \  \ (  ) (     ( ( ) )  )    )  )  )  /
                    \  \  \  \ () (      (  )   )   )  )  )  )  /
                     \  \  \  \     (     )   (  ) )   ) )  )  /
                      \  \  \  \    (     )  (   )  )  ) )  )  /
                       \  \  \  \   (      )  (   )  )   ) )  /
                        \  \  \  \  (       ) (    ) )  ) )  /
                         \  \  \  \  (      ( (    )  )  )  /
                          \  \  \  \ (       ) (   )  )  )  /
                           \  \  \  \ \______\_/__/  /
                            \  \  \  \__________/ /
                             \  \  \____________/

"@  

#Hashtable used with the roll hit to match up the correct die face
function Roll_Action_Function {
    $Roll_Action = @{
        1 = {Write-Host "$Die_Face_1"}
        2 = {Write-Host "$Die_Face_2"}
        3 = {Write-Host "$Die_Face_3"}
        4 = {Write-Host "$Die_Face_4"}
        5 = {Write-Host "$Die_Face_5"}
        6 = {Write-Host "$Die_Face_6"}
        7 = {Write-Host "$Die_Face_7"}
        8 = {Write-Host "$Die_Face_8"}
        9 = {Write-Host "$Die_Face_9"}
        10 = {Write-Host "$Die_Face_10"}
        11 = {Write-Host "$Die_Face_11"}
        12 = {Write-Host "$Die_Face_12"}
        13 = {Write-Host "$Die_Face_13"}
        14 = {Write-Host "$Die_Face_14"}
        15 = {Write-Host "$Die_Face_15"}
        16 = {Write-Host "$Die_Face_16"}
        17 = {Write-Host "$Die_Face_17"}
        18 = {Write-Host "$Die_Face_18"}
        19 = {Write-Host "$Die_Face_19"}
        20 = {Write-Host "$Die_Face_20"}
    }
    if ($Roll_Action.ContainsKey($roll)) {
      $Roll_Action[$roll].Invoke()
    }
}

#After the die is rolled (die type entered) the script will use the correct if statement for the rolled die and Get-Random to generate the number rolled. 
If ($Die -eq 'd4') {
    $roll = Get-Random -Minimum 1 -Maximum 5
    Write-Host "Your $Die rolled a $roll."
    Roll_Action_Function
}
ElseIf  ($Die -eq 'd6') {
    $roll = Get-Random -Minimum 1 -Maximum 7
    Write-Host "Your $Die rolled a $roll."
    Roll_Action_Function
} 
ElseIf  ($Die -eq 'd8') {
    $roll = Get-Random -Minimum 1 -Maximum 9
    Write-Host "Your $Die rolled a $roll."
    Roll_Action_Function
}   
ElseIf  ($Die -eq 'd10') {
    $roll = Get-Random -Minimum 1 -Maximum 11
    Write-Host "Your $Die rolled a $roll."
    Roll_Action_Function
}
ElseIf  ($Die -eq 'd12') {
        $roll = Get-Random -Minimum 1 -Maximum 13
        Write-Host "Your $Die rolled a $roll."
        Roll_Action_Function
}
ElseIf ($Die -eq 'd20') {
        $roll = Get-Random -Minimum 1 -Maximum 21  
        Write-Host "Your $Die rolled a $roll."
        Roll_Action_Function
}