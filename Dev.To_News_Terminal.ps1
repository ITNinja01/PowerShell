<#
.SYNOPSIS
This script will display news from Dev.To on the terminal using their JSON format (API) webpage.
.COMPONENT
PowerShell, Dev.To having their newest articles in a JSON format (API)
#>

Write-Host "Latest news from Dev.To 🧑‍💻"

##carriage return to make it easier to read in the terminal
$crlf = [Environment]::NewLine

$dev_articles = Invoke-RestMethod -Uri "https://dev.to/api/articles"

#Sorts articles by a date. Important since PowerShell will display them in the terminal at random.
$sortedArticles = $dev_articles | Sort-Object -Property published_timestamp 

#Tons of information is given. However I only need the title, the published date, and the URl; if I want to read the full article.
$sortedArticles | ForEach-Object {
    $crlf
    $_.title
    $_.published_timestamp  
    $_.url
}