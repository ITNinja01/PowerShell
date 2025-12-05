function Get-Music {
    .SYNOPSIS
    A script to get latest articles from Music Forem.
    .DESCRIPTION
    'From composing and gigging to gear, hot music takes, and everything in between.'
    This script fetches the latest articles from Music Forem and displays the title, published date, and URL in the terminal.
    .FUNCTIONALITY
    API Calls, JSON, Terminal Output
    .COMPONENT
    'PowerShell, Forem.com having their newest articles in a JSON format (API)'
    .ROLE
    IT Professionals, Music Enthusiasts
    .NOTES
    Developer: ITNinja01
    Date: 12-05-2025   
    Version: 0.0.1
    #>

    if (-not (Test-Connection music.forem.com -Count 1 -Quiet)) {
        Write-Error "music.forem.com is not reachable. Please check your internet connection."
        Exit 1
    }

    Write-Host "Latest news from Music Forem 🎵"

    #Carriage return to make it easier to read in the terminal
    $crlf = [Environment]::NewLine

    $Articles = Invoke-RestMethod -Uri "music.forem.com/api/articles"

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