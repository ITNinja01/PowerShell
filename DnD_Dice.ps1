<#
.SYNOPSIS
This script emulates a Dungeons & Dragons dice being rolled.
.NOTES
Recommendation from a colleague was to add ASCII art with a role and have 20 be a dragon.
#>

[CmdletBinding()]   
param (
  [Parameter(Mandatory)]
  [ValidateSet("d4", "d6", "d8", "d10", "d12", "d20")]
  $Die  
)

#ASCII art of die faces from ChatGPT to use when the die is rolled. 
$DieFace1 = @"
         _______
       /       /\ 
      /  x    /  \
     /_______/    \
    /       \      \
   /   1     \______\
  /___________\      
"@  
$DieFace2 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   2     \______\
  /___________\      
"@  
$DieFace3 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   3     \______\
  /___________\      
"@  
$DieFace4 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   4     \______\
  /___________\      
"@  
$DieFace5 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   5     \______\
  /___________\      
"@  
$DieFace6 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   6     \______\
  /___________\      
"@  
$DieFace7 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   7     \______\
  /___________\      
"@  
$DieFace8 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   8     \______\
  /___________\      
"@ 
$DieFace9 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   9     \______\
  /___________\      
"@   
$DieFace10 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   10    \______\
  /___________\      
"@  
$DieFace11 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  11     \______\
  /___________\      
"@  
$DieFace12 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   12    \______\
  /___________\      
"@  
$DieFace13 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  13     \______\
  /___________\      
"@  
$DieFace14 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  14     \______\
  /___________\      
"@  
$DieFace15 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  15     \______\
  /___________\      
"@  
$DieFace16 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  16     \______\
  /___________\      
"@  
$DieFace17 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /  17     \______\
  /___________\      
"@  
$DieFace18 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   18    \______\
  /___________\      
"@  
$DieFace19 = @"
         _______
       /       /\ 
      /   x   /  \
     /_______/    \
    /       \      \
   /   19    \______\
  /___________\      
"@  
$DieFace20 = @"
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
  $RollAction = @{
    1  = { Write-Host "$DieFace1" }
    2  = { Write-Host "$DieFace2" }
    3  = { Write-Host "$DieFace3" }
    4  = { Write-Host "$DieFace4" }
    5  = { Write-Host "$DieFace5" }
    6  = { Write-Host "$DieFace6" }
    7  = { Write-Host "$DieFace7" }
    8  = { Write-Host "$DieFace8" }
    9  = { Write-Host "$DieFace9" }
    10 = { Write-Host "$DieFace10" }
    11 = { Write-Host "$DieFace11" }
    12 = { Write-Host "$DieFace12" }
    13 = { Write-Host "$DieFace13" }
    14 = { Write-Host "$DieFace14" }
    15 = { Write-Host "$DieFace15" }
    16 = { Write-Host "$DieFace16" }
    17 = { Write-Host "$DieFace17" }
    18 = { Write-Host "$DieFace18" }
    19 = { Write-Host "$DieFace19" }
    20 = { Write-Host "$DieFace20" }
  }
  if ($RollAction.ContainsKey($roll)) {
    $RollAction[$roll].Invoke()
  }
}

#After the die is rolled (die type entered) the script will use the correct if statement for the rolled die and Get-Random to generate the number rolled. 
If ($Die -eq 'd4') {
  $roll = Get-Random -Minimum 1 -Maximum 5
  Write-Host "Your $Die rolled a $roll."
  Roll_Action_Function
}
ElseIf ($Die -eq 'd6') {
  $roll = Get-Random -Minimum 1 -Maximum 7
  Write-Host "Your $Die rolled a $roll."
  Roll_Action_Function
} 
ElseIf ($Die -eq 'd8') {
  $roll = Get-Random -Minimum 1 -Maximum 9
  Write-Host "Your $Die rolled a $roll."
  Roll_Action_Function
}   
ElseIf ($Die -eq 'd10') {
  $roll = Get-Random -Minimum 1 -Maximum 11
  Write-Host "Your $Die rolled a $roll."
  Roll_Action_Function
}
ElseIf ($Die -eq 'd12') {
  $roll = Get-Random -Minimum 1 -Maximum 13
  Write-Host "Your $Die rolled a $roll."
  Roll_Action_Function
}
ElseIf ($Die -eq 'd20') {
  $roll = Get-Random -Minimum 1 -Maximum 21  
  Write-Host "Your $Die rolled a $roll."
  Roll_Action_Function
}