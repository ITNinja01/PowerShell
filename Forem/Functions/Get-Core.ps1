function Get-Core {
    <#
.SYNOPSIS
A script to get latest articles from Core Forem.
.DESCRIPTION
This script fetches the latest articles from Core Forem and displays the title, published date, and URL in the terminal.
Discussing the core forem open source software project — features, bugs, performance, self-hosting.
.FUNCTIONALITY
API Calls, JSON, Terminal Output
.COMPONENT
PowerShell, Forem.com having their newest articles in a JSON format (API)
.ROLE
IT Professionals
.NOTES
Developer: ITNinja01
Date: 12-05-2025   
Version: 0.0.1
#>

    if (-not (Test-Connection core.forem.com -Count 1 -Quiet)) {
        Write-Error "core.forem.com is not reachable. Please check your internet connection."
        Exit 1
    }

    Write-Host "Latest news from Forem Core 🧑‍💻"

    #Carriage return to make it easier to read in the terminal
    $crlf = [Environment]::NewLine

    $Articles = Invoke-RestMethod -Uri "https://core.forem.com/api/articles"

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