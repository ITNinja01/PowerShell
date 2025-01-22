<#
.SYNOPSIS
This sciprt emulates a Dungeons & Dragons dice being rolled.
#>

[CmdletBinding()]   
    param (
        [Parameter(Mandatory)]
        [ValidateSet("d4","d6","d8","d10","d12","d20")]
        $Die  
    )

#ASCII art of die faces from ChatGPT to use when the die is rolled
$Die_Face_1 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /   1     \______\
  /___________\      
"@  
$Die_Face_2 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /   2     \______\
  /___________\      
"@  
$Die_Face_3 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /   3     \______\
  /___________\      
"@  
$Die_Face_4 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /   4     \______\
  /___________\      
"@  
$Die_Face_5 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /   5     \______\
  /___________\      
"@  
$Die_Face_6 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /   6     \______\
  /___________\      
"@  
$Die_Face_7 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /   7     \______\
  /___________\      
"@  
$Die_Face_8 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /   8     \______\
  /___________\      
"@ 
$Die_Face_9 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /   9     \______\
  /___________\      
"@   
$Die_Face_10 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /   10    \______\
  /___________\      
"@  
$Die_Face_11 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /  11     \______\
  /___________\      
"@  
$Die_Face_12 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /   12    \______\
  /___________\      
"@  
$Die_Face_13 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /  13     \______\
  /___________\      
"@  
$Die_Face_14 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /  14     \______\
  /___________\      
"@  
$Die_Face_15 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /  15     \______\
  /___________\      
"@  
$Die_Face_16 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /  16     \______\
  /___________\      
"@  
$Die_Face_17 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /  17     \______\
  /___________\      
"@  
$Die_Face_18 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /   18    \______\
  /___________\      
"@  
$Die_Face_19 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /   19    \______\
  /___________\      
"@  
$Die_Face_20 = @"
         _______
       /       /\ 
      /   20  /  \
     /_______/    \
    /       \      \
   /   20     \______\
  /___________\      

                              ___====-_  _-====___
                           _--^^^#####//      \\#####^^^--_
                        _-^##########// (    ) \\##########^-_
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
#After the die is rolled (die type entered) the script will use the correct if statement for the rolled die and Get-Random to generate the number rolled. 
If ($Die -eq 'd4') {
    $roll = Get-Random -Minimum 1 -Maximum 5
    Write-Host "Your $Die rolled a $roll."
    $Roll_Action = @{
        1 = {Write-Host "$Die_Face_1"}
        2 = {Write-Host "$Die_Face_2"}
        3 = {Write-Host "$Die_Face_3"}
        4 = {Write-Host "$Die_Face_4"}

    }
    if ($Roll_Action.ContainsKey($roll)) {
      $Roll_Action[$roll].Invoke()
      }
}
ElseIf  ($Die -eq 'd6') {
    $roll = Get-Random -Minimum 1 -Maximum 7
    Write-Host "Your $Die rolled a $roll."
} 
ElseIf  ($Die -eq 'd8') {
    $roll = Get-Random -Minimum 1 -Maximum 9
    Write-Host "Your $Die rolled a $roll."
}   
ElseIf  ($Die -eq 'd10') {
    $roll = Get-Random -Minimum 1 -Maximum 11
    Write-Host "Your $Die rolled a $roll."
}
ElseIf  ($Die -eq 'd12') {
        $roll = Get-Random -Minimum 1 -Maximum 13
        Write-Host "Your $Die rolled a $roll."
}
ElseIf ($Die -eq 'd20') {
        $roll = Get-Random -Minimum 1 -Maximum 21
        Write-Host "Your $Die rolled a $roll."
}