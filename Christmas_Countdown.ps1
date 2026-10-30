<#
.SYNOPSIS
A script to tell how many til Christmas using Get-Date
.NOTES
I had to code many more lines of code to figure out if this year is a leap year and if the next one would be. In both cases had to fix the bug of $DaysTilChristmas being in the negative after Christmas before the new year.
#>

#Variables needed for dates and a little fun.
$TodayDate = Get-Date
$CurrentYear = get-date -Format yyyy
$NextYear = $CurrentYear + 1
$ChristmasEmojis = '⛪🎅❄️🎄'
$MerryChristmas = @"
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
if ((($CurrentYear % 4 -eq 0) -and ($CurrentYear % 100 -ne 0)) -or ($CurrentYear % 400 -eq 0)) {
    $DaysTilChristmas = 359 - $TodayDate.DayOfYear + 1
}
else {
    $DaysTilChristmas = 358 - $TodayDate.DayOfYear + 1
}

#Needing to know if next year is a leap year is important because its impacts the days after Christmas until the new year.
if ((($NextYear % 4 -eq 0) -and ($NextYear % 100 -ne 0)) -or ($NextYear % 400 -eq 0))
{ #Days for whens its a leap year next year.    
    if ($DaysTilChristmas -eq 0) {
        Write-Host "$MerryChristmas"
    }
    elseif ($DaysTilChristmas -eq -1) {
        Write-Host "365 day(s) until Christmas $ChristmasEmojis!"
    }
    elseif ($DaysTilChristmas -eq -2) {
        Write-Host "364 day(s) until Christmas $ChristmasEmojis!"
    }
    elseif ($DaysTilChristmas -eq -3) {
        Write-Host "363 day(s) until Christmas $ChristmasEmojis!"
    }
    elseif ($DaysTilChristmas -eq -4) {
        Write-Host "362 day(s) until Christmas $ChristmasEmojis!"
    }
    elseif ($DaysTilChristmas -eq -5) {
        Write-Host "361 day(s) until Christmas $ChristmasEmojis!"
    }
    elseif ($DaysTilChristmas -eq -6) {
        Write-Host "360 day(s) until Christmas $ChristmasEmojis!"
    }
    else {
        Write-Host "$DaysTilChristmas day(s) until Christmas $ChristmasEmojis!"
    }
}
#Days for if it is not a leap year next year.
else {
    if ($DaysTilChristmas -eq 0) {
        Write-Host "$MerryChristmas "
    }
    elseif ($DaysTilChristmas -eq -1) {
        Write-Host "364 day(s) until Christmas $ChristmasEmojis!"
    }
    elseif ($DaysTilChristmas -eq -2) {
        Write-Host "363 day(s) until Christmas $ChristmasEmojis!"
    }
    elseif ($DaysTilChristmas -eq -3) {
        Write-Host "362 day(s) until Christmas $ChristmasEmojis!"
    }
    elseif ($DaysTilChristmas -eq -4) {
        Write-Host "361 day(s) until Christmas $ChristmasEmojis!"
    }
    elseif ($DaysTilChristmas -eq -5) {
        Write-Host "360 day(s) until Christmas $ChristmasEmojis!"
    }
    elseif ($DaysTilChristmas -eq -6) {
        Write-Host "359 day(s) until Christmas $ChristmasEmojis!"
    }
    else {
        Write-Host "$DaysTilChristmas day(s) until Christmas $ChristmasEmojis!"
    }
}