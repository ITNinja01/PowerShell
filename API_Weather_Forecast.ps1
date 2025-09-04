<#
.SYNOPSIS
This script will show the weather forecast for now, next week of time and next 8 hours based off your public IP.
.DESCRIPTION
This script uses the public IP information from Ipinfo.io to feed the longitude and latitude to the Weather.Gov API which than receives the forecast.
.COMPONENT
Ipinfo.io, Weather.Gov API, PowerShell
#>

#Making a request to a public IP information service 
$response = Invoke-RestMethod -Uri "http://ipinfo.io/json"

#Extracts city, country, latitude and longitude from the response
$location = $response.loc -split ","
$latitude = $location[0]
$longitude = $location[1]
$City = $response.city
$Country = $response.country
Write-Host "$City, $Country Forecast"

#Creating variables to access weather
$API_Weather_URL = "https://api.weather.gov/points/$latitude,$longitude"
$Full_Weather = Invoke-RestMethod $API_Weather_URL

Write-Host "Latest:"
(Invoke-RestMethod ($Full_Weather.properties.forecast)).Properties.periods | Select-Object name, detailedForecast -First 1 -ExpandProperty detailedForecast | Out-Default

#carriage return, needed to make sure lines do not touch in the terminal    
$crlf = "`r`n"
$crlf

Write-Host "The next week:"
(Invoke-RestMethod ($Full_Weather.properties.forecast)).Properties.periods | Select-Object name, temperature, shortForecast, windSpeed | Out-Default

Write-Host "The next 8 hours:"
$Hourly_Weather = (Invoke-RestMethod ($Full_Weather.properties.forecastHourly)).Properties.periods | Select-Object startTime, endTime, temperature, probabilityOfPrecipitation
$Hourly_Weather[0..7]