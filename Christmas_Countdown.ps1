<#
.SYNOPSIS
A script to tell how many til Christmas using Get-Date
.NOTES
I had to code many more lines of code to figure out if this year is a leap year and if the next one would be. In both cases had to fix the bug of $Days_Til_Christmas being in the negative after Christmas before the new year.
#>

#Variables needed for dates and a little fun.
$Today_Date = Get-Date
$Current_Year = get-date -Format yyyy
$Next_Year = $Current_Year + 1
$Christmas_Emojis = '⛪🎅❄️🎄'
$Merry_Christmas = @"
           *
          /#\
         /###\
        /#####\
       /#######\
      /#########\
     /###########\
    /#############\
   /###############\
  /#################\
 /###################\
/#####################\
         |||||
         |||||
         |||||

    Merry Christmas!
"@

#Check if the current year is a leap year. Using the Day of the year as my point of reference. Also adding one due to people still counting the day they are on. 
if ((($Current_Year % 4 -eq 0) -and ($Current_Year % 100 -ne 0)) -or ($Current_Year % 400 -eq 0)) {
    $Days_Til_Christmas = 359 - $Today_Date.DayOfYear + 1
}
else {
    $Days_Til_Christmas = 358 - $Today_Date.DayOfYear + 1
}

#Needing to know if next year is a leap year is important because its impacts the days after Christmas until the new year.
if ((($Next_Year % 4 -eq 0) -and ($Next_Year % 100 -ne 0)) -or ($Next_Year % 400 -eq 0))   
{ #Days for whens its a leap year next year.    
    if ($Days_Til_Christmas -eq 0) {
        Write-Host "$Merry_Christmas"
    }
    elseif ($Days_Til_Christmas -eq -1) {
        Write-Host "365 day(s) until Christmas $Christmas_Emojis!"
    }
    elseif ($Days_Til_Christmas -eq -2) {
        Write-Host "364 day(s) until Christmas $Christmas_Emojis!"
    }
    elseif ($Days_Til_Christmas -eq -3) {
        Write-Host "363 day(s) until Christmas $Christmas_Emojis!"
    }
    elseif ($Days_Til_Christmas -eq -4) {
        Write-Host "362 day(s) until Christmas $Christmas_Emojis!"
    }
    elseif ($Days_Til_Christmas -eq -5) {
        Write-Host "361 day(s) until Christmas $Christmas_Emojis!"
    }
    elseif ($Days_Til_Christmas -eq -6) {
        Write-Host "360 day(s) until Christmas $Christmas_Emojis!"
    }
    else {
        Write-Host "$Days_Til_Christmas day(s) until Christmas $Christmas_Emojis!" 
    }
}
#Days for if it is not a leap year next year.
else {
    if ($Days_Til_Christmas -eq 0) {
        Write-Host "$Merry_Christmas "
    }
    elseif ($Days_Til_Christmas -eq -1) {
        Write-Host "364 day(s) until Christmas $Christmas_Emojis!"
    }
    elseif ($Days_Til_Christmas -eq -2) {
        Write-Host "363 day(s) until Christmas $Christmas_Emojis!"
    }
    elseif ($Days_Til_Christmas -eq -3) {
        Write-Host "362 day(s) until Christmas $Christmas_Emojis!"
    }
    elseif ($Days_Til_Christmas -eq -4) {
        Write-Host "361 day(s) until Christmas $Christmas_Emojis!"
    }
    elseif ($Days_Til_Christmas -eq -5) {
        Write-Host "360 day(s) until Christmas $Christmas_Emojis!"
    }
    elseif ($Days_Til_Christmas -eq -6) {
        Write-Host "359 day(s) until Christmas $Christmas_Emojis!"
    }
    else {
        Write-Host "$Days_Til_Christmas day(s) until Christmas $Christmas_Emojis!" 
    }
}