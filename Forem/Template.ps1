function Get-Dev.To {
<#
.SYNOPSIS

.DESCRIPTION

.FUNCTIONALITY
API Calls, JSON, Terminal Output
.COMPONENT
PowerShell, Forem.com having their newest articles in a JSON format (API)
.ROLE
IT Professionals
#>

Write-Host "Latest news from  🧑‍💻"

##carriage return to make it easier to read in the terminal
$crlf = [Environment]::NewLine

$Articles = Invoke-RestMethod -Uri ""

#Sorts articles by a date. Important since PowerShell will display them in the terminal at random.
$sortedArticles = $Articles | Sort-Object -Property published_timestamp 

#Tons of information is given. However I only need the title, the published date, and the URl; if I want to read the full article.
$sortedArticles | ForEach-Object {
    $crlf
    $_.title
    $_.published_timestamp  
    $_.url
}   
}
