<#
.SYNOPSIS
This script uses the API from weather.gov to display the forcast for Lansing, MI. 


https://blog.ironmansoftware.com/daily-powershell/powershell-weather/

#>

# Make a request to an IP-based geolocation service
$response = Invoke-RestMethod -Uri "http://ipinfo.io/json"

 # Extract city, country, latitude and longitude from the response
$location = $response.loc -split ","
$latitude = $location[0]
$longitude = $location[1]
$City = $response.city
$Country = $response.country

Write-Host "$City, $Country Forcast"

Write-Host "The next 10 days:" 

$API_Weather_URL = "https://api.weather.gov/points/$latitude,$longitude"

$Full_Weather = Invoke-RestMethod $API_Weather_URL
(Invoke-RestMethod ($Full_Weather.properties.forecast)).Properties.periods | Select-Object name, temperature, shortForecast, windSpeed | Out-Default

Write-Host "The next 8 hours:"
$Hourly_Weather = (Invoke-RestMethod ($Full_Weather.properties.forecastHourly)).Properties.periods | Select-Object startTime, endTime, temperature, probabilityOfPrecipitation 

$Hourly_Weather[1..8]