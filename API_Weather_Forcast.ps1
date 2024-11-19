<#
.SYNOPSIS
This script will show the weather forecast for the next week and next 8 hours based off your public IP.
.DESCRIPTION
This script uses the public IP informatiom from Ipinfo.io to feed the longitude and latitude to the Weather.Gov API which than receives the forecast.
.COMPONENT
Ipinfo.io, Weather.Gov API, PowerShell
#>

# Making a request to a public IP informatiom service 
$response = Invoke-RestMethod -Uri "http://ipinfo.io/json"

#Extracts city, country, latitude and longitude from the response
$location  = $response.loc -split ","
$latitude  = $location[0]
$longitude = $location[1]
$City      = $response.city
$Country   = $response.country

Write-Host "$City, $Country Forcast"

Write-Host "The next week:" 

$API_Weather_URL = "https://api.weather.gov/points/$latitude,$longitude"

$Full_Weather = Invoke-RestMethod $API_Weather_URL
(Invoke-RestMethod ($Full_Weather.properties.forecast)).Properties.periods | Select-Object name, temperature, shortForecast, windSpeed | Out-Default

Write-Host "The next 8 hours:"
$Hourly_Weather = (Invoke-RestMethod ($Full_Weather.properties.forecastHourly)).Properties.periods | Select-Object startTime, endTime, temperature, probabilityOfPrecipitation 
$Hourly_Weather[0..7]