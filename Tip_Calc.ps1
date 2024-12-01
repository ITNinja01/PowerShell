<#
.SYNOPSIS
This script can do a tip % calc for a bill at a restaurant
#>

#Using Read-host to get input for script
[Float]$Bill = Read-Host "What is the total on the bil?"
[Float]$Tip  = Read-Host "What is the tip to give in percents: for example 10?"

#Takes the tip % input and turns it into a .o1 fraction
[Float]$Tip_from_user += $Tip * .01

#Finds tip amount
[Float]$Tip_amount += $Bill * $Tip_from_user

#Rounds tip amount to two decimals
$Tip_2_decimals = "{0:n2}" -f[Float]$Tip_amount

# Add Bill and Tip with two decimals to find total amount
[Float]$Total_amount += $Bill + $Tip_2_decimals

#Uses Write-host to show tip and bill and tip together
Clear-Host
Write-Host "The original bill is $Bill"
Write-Host "The tip amount is $ $Tip_2_decimals."
Write-Host "The total for the bill and tip together is $ $Total_amount." 

#MUST nuke (null) vars. in memory for script to have correct numbers back if used more than once in same session.
Clear-Variable -Name Bill,
                      Tip,
                      Tip_from_user,
                      Tip_amount,
                      Total_amount,
                      Tip_2_decimals