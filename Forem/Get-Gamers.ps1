function Get-Gamers {
    <#
.SYNOPSIS
This script will display news from Gamers Forem (gg.forem.com) on the terminal using their JSON format (API) webpage.
.DESCRIPTION
This script fetches the latest articles from Gamers Forem (gg.forem.com) and displays the title, published date, and URL in the terminal.
.FUNCTIONALITY
API Calls, JSON, Terminal Output
.COMPONENT
PowerShell, Forem.com forums having their newest articles in a JSON format (API) formatted webpage.
.ROLE
 IT Professionals, Developers, Gamers
#>

    Write-Host "Latest news from Gamers Forem 🎮"

    #Carriage return to make it easier to read in the terminal
    $crlf = [Environment]::NewLine

    $Articles = Invoke-RestMethod -Uri "https://gg.forem.com/api/articles"

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