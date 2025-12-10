function Get-Scale {
    <#
.SYNOPSIS
A script to get latest articles from Scale Forem.
.DESCRIPTION
For engineers building software at scale. We discuss architecture, cloud-native, and SRE—the hard-won lessons you can't just Google
This script fetches the latest articles from Scale Forem and displays the title, published date, and URL in the terminal.
.FUNCTIONALITY
API Calls, JSON, Terminal Output
.COMPONENT
PowerShell, Forem.com having their newest articles in a JSON format (API)
.ROLE
IT Professionals, Developers, Software Engineers
.NOTES
Developer: ITNinja01
Date: 12-05-2025   
Version: 0.0.1
#>

    if (-not (Test-Connection scale.forem.com -Count 1 -Quiet)) {
        Write-Error "scale.forem.com is not reachable. Please check your internet connection."
        Exit 1
    }

    Write-Host "Latest news from Scale Forem 🧑‍💻"

    #Carriage return to make it easier to read in the terminal
    $crlf = [Environment]::NewLine

    $Articles = Invoke-RestMethod -Uri "https://scale.forem.com/api/articles"

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