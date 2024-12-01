<#
.SYNOPSIS
This script will tell you the sales tax of which state you are in based on your public IP address.
.DESCRIPTION
Using the region information from Ipinfo.io this script can be used for tavel between states to know the sales tax.
.COMPONENT
Ipinfo.io, PowerShell
.LINK
https://taxfoundation.org/data/all/state/2024-sales-taxes/
.NOTES
1.  This script would be more compact and auto-updating if a sales tax API where used instead of hard coding it in a hash table. I could not find an API for this purpose that was free to use.
2.
This script was inspired by a C program that I created in college to calculate sales tax on items in Michigan (found in the same folder).
#>
$response    = Invoke-RestMethod -Uri "http://ipinfo.io/json"
$Found_State = $response.region

$States_Hashtable = @{
    'Alabama'              = {Write-Host "Alabama's sales tax is 4%."}
    'Alaska'               = {Write-Host 'Alaska has no sales taxes (0%).'}
    'Arizona'              = {Write-Host "Arizona's sales tax is 5.60%."}
    'Arkansas'             = {Write-Host "Arkansas' sales tax is 6.50%."}
    'California'           = {Write-Host "California's sales tax is 7.25%."}
    'Colorado'             = {Write-Host "Colorado's sales tax is 2.90%."}
    'Connecticut'          = {Write-Host "Connecticut's sales tax is 6.35%."}
    'Delaware'             = {Write-Host 'Delaware has no sales taxes (0%).'}
    'Florida'              = {Write-Host "Florida's sales tax is 6%."}
    'Georgia'              = {Write-Host "Georgia's sales tax is 4%."}
    'Hawaii'               = {Write-Host "Hawaii's sales tax is 4."}
    'Idaho'                = {Write-Host "Idaho's sales tax is 6%."}
    'Illinois'             = {Write-Host "Illinois's sales tax is 6.25%."}
    'Indiana'              = {Write-Host "Indiana's sales tax is 7%."}
    'Iowa'                 = {Write-Host "Iowa's sales tax is 6%."}
    'Kansas	'              = {Write-Host "'s sales tax is 6.50%."}
    'Kentucky'             = {Write-Host "Kentucky's sales tax is 6%."}
    'Louisiana'            = {Write-Host "Louisiana's sales tax is 4.45%."}
    'Maine'                = {Write-Host "Maine's sales tax is 5.50%."}
    'Maryland'             = {Write-Host "Maryland's sales tax is 6%."}
    'Massachusetts'        = {Write-Host "Massachusetts's sales tax is 6.25%."}
    'Michigan'             = {Write-Host "Michigan's sales tax is 6%."}
    'Minnesota'            = {Write-Host "Minnesota's sales tax is 6.88%."}
    'Mississippi'          = {Write-Host "Mississippi's sales tax is 7%."}
    'Missouri'             = {Write-Host "Missouri's sales tax is 4.23%."}
    'Montana'              = {Write-Host 'Montana has no sales taxes (0%).'}
    'Nebraska'             = {Write-Host "Nebraska's sales tax is 5.50%."}
    'Nevada'               = {Write-Host "Nevada's sales tax is 6.85%."}
    'New Hampshire'        = {Write-Host "New Hampshire has no sales taxes (0%)."}
    'New Jersey'           = {Write-Host "'s sales tax is 6.63%."}
    'New Mexico'           = {Write-Host "New Mexico's sales tax is 4.88%."}
    'New York'             = {Write-Host "New York's sales tax is 4."}
    'North Carolina	'      = {Write-Host "North Carolina	's sales tax is 4.75%."}
    'North Dakota'         = {Write-Host "North Dakota's sales tax is 5%."}
    'Ohio'                 = {Write-Host "Ohio's sales tax is 5.75%."}
    'Oklahoma'             = {Write-Host "Oklahoma's sales tax is 4.5%."}
    'Oregon'               = {Write-Host "Oregon has no sales taxes (0%)."}
    'Pennsylvania'         = {Write-Host "Pennsylvania's sales tax is 6%."}
    'Rhode Island'         = {Write-Host "Rhode Island's sales tax is 7%."}
    'South Carolina'       = {Write-Host "South Carolina's sales tax is 6%."}
    'South Dakota'         = {Write-Host "South Dakota's sales tax is 4.20%."}
    'Tennessee'            = {Write-Host "Tennessee's sales tax is 7%."}
    'Texas'                = {Write-Host "Texas's sales tax is 6.25."}
    'Utah'                 = {Write-Host "6.25%'s sales tax is 6.10%."}
    'Vermont'              = {Write-Host "Vermont's sales tax is 6%."}
    'Virginia'             = {Write-Host "Virginia's sales tax is 5.30%."}
    'Washington'           = {Write-Host "Washington's sales tax is 6.50%."}
    'West Virginia'        = {Write-Host "West Virginia's sales tax is 6%."}
    'Wisconsin'            = {Write-Host "Wisconsin's sales tax is 5%."}
    'Wyoming'              = {Write-Host "Wyoming's sales tax is 4%."}
    'District of Columbia' = {Write-Host "District of Columbia's sales tax is 6%."}
}

if ($States_Hashtable.ContainsKey($Found_State)) {
   $States_Hashtable[$Found_State].Invoke()
    }
else {
    Write-Host "You are not in the United States. No sales tax information available."
}