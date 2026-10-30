<#
.SYNOPSIS
This script can do a tip % calc for a bill at a restaurant
#>

#Using Read-host to get input for script
[Float]$Bill = Read-Host "What is the total on the bil?"
[Float]$Tip = Read-Host "What is the tip to give in percents: for example 10?"

#Takes the tip % input and turns it into a .o1 fraction
[Float]$TipFromUser += $Tip * .01

#Finds tip amount
[Float]$TipAmount += $Bill * $TipFromUser

#Rounds tip amount to two decimals
$Tip2Decimals = "{0:n2}" -f [Float]$TipAmount

# Add Bill and Tip with two decimals to find total amount
[Float]$TotalAmount += $Bill + $Tip2Decimals

#Uses Write-host to show tip and bill and tip together
Clear-Host
Write-Host "The original bill is $Bill"
Write-Host "The tip amount is $ $Tip2Decimals."
Write-Host "The total for the bill and tip together is $ $TotalAmount."

#MUST nuke (null) vars. in memory for script to have correct numbers back if used more than once in same session.
Clear-Variable -Name Bill,
Tip,
Tip_from_user,
Tip_amount,
Total_amount,
Tip_2_decimals