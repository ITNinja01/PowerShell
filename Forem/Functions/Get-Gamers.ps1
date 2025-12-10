function Get-Gamers {
    <#
.SYNOPSIS
This script will display news from Gamers Forem (gg.forem.com) on the terminal using their JSON format (API) webpage.
.DESCRIPTION
An inclusive community for gaming enthusiasts
This script fetches the latest articles from Gamers Forem (gg.forem.com) and displays the title, published date, and URL in the terminal.
.FUNCTIONALITY
API Calls, JSON, Terminal Output
.COMPONENT
PowerShell, Forem.com forums having their newest articles in a JSON format (API) formatted webpage.
.ROLE
 IT Professionals, Developers, Gamers
 .NOTES
Developer: ITNinja01
Date: 12-05-2025   
Version: 0.0.1
#>

    if (-not (Test-Connection gg.forem.com -Count 1-Quiet )) {
        Write-Error "gg.forem.com is not reachable. Plese check your internet connection."
        Exit 1
    }

    Write-Host "Latest news from Gamers Forem 🎮"

    #Carriage return to make it easier to read in the terminal
    $crlf = [Environment]::NewLine

    $Articles = Invoke-RestMethod -Uri "https://gg.forem.com/api/articles"

    #Sorts articles by a date. Important since PowerShell will display them in the terminal at random.
    $SortedArticles = $Articles | Sort-Object -Property published_timestamp 

    #Tons of information is given. However I only need the title, the published date, and the URl; if I want to read the full article.
    $SortedArticles | ForEach-Object {
        $crlf
        $_.title
        $_.published_timestamp  
        $_.url
    }   
}