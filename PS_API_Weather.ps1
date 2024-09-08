<#
.SYNOPSIS
This script uses the API from weather.gov to display the forcast for Lansing, MI. 

.EXTERNALHELP
https://blog.ironmansoftware.com/daily-powershell/powershell-weather/

#>

# Make a request to an IP-based geolocation service

$response = Invoke-RestMethod -Uri "http://ipinfo.io/json"

 # Extract latitude and longitude from the response

$location = $response.loc -split ","

$latitude = $location[0]

$longitude = $location[1]

Write-Host "$latitude $longitude"

Write-Host "Forcast for the next 10 days:" 

$API_Weather_URL = "https://api.weather.gov/points/$latitude,$longitude"

$Full_Weather = Invoke-RestMethod $API_Weather_URL
(Invoke-RestMethod ($Full_Weather.properties.forecast)).Properties.periods | Select-Object name, temperature, shortForecast, windSpeed | Out-Default

Write-Host "Forcast for the next 8 hours:"
$Hourly_Weather = (Invoke-RestMethod ($Full_Weather.properties.forecastHourly)).Properties.periods | Select-Object startTime, endTime, temperature, probabilityOfPrecipitation 

$Hourly_Weather[1..8]