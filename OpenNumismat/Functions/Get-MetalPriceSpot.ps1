function Get-MetalPriceSpot {
<#>
.SYNOPSIS
Retrieves the current spot price of a specified metal (Gold, Silver, or Copper) in USD.
.DESCRIPTION
The Get-MetalPriceSpot function fetches the current spot price of the specified metal (Gold, Silver, or Copper) in USD using the GoldPrice API. The function requires the user to specify the metal type as a parameter.
.COMPONENT
GoldPrice API
.PARAMETER Metal
Specifies the metal for which to retrieve the spot price. Valid values are "Gold", "Silver", or "Copper".
.EXAMPLE
Get-MetalPriceSpot -Metal Gold
This command retrieves the current spot price of Gold in USD.
.LINK
Information about the API used in this function can be found at
https://goldprice.dev/docs/api-reference
.NOTES
Developer: ITNinja01
Date: 11-13-2026
Version: 1.0.0
#>

[CmdletBinding()]
param(
    [Parameter(Mandatory)]
    [ValidateSet("Gold", "Silver", "Copper")]
    [string]$Metal
)

# Determine the metal type code based on the specified metal
if ($Metal -eq 'Gold') {
    $MetalType = 'XAU'    
}
elseif ($Metal -eq 'Silver') {
    $MetalType = 'XAG'
}
else {
    $MetalType = 'HG'
}

try {
    $LiveMetalPrice = Invoke-RestMethod -Uri "https://api.goldprice.dev/v1/prices?symbol=$MetalType-USD-SPOT"
} catch {
    Write-Error "Failed to retrieve the spot price for $Metal. Please check your internet connection or try again later."
    return
}

$LiveMetalPrice = Invoke-RestMethod -Uri "https://api.goldprice.dev/v1/prices?symbol=$MetalType-USD-SPOT"

Write-Host "The current spot price for $Metal is:"
$LiveMetalPrice.symbols
}