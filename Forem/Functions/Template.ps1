function Get-WhatEver {
    <#
.SYNOPSIS

.DESCRIPTION


.FUNCTIONALITY
API Calls, JSON, Terminal Output
.COMPONENT
PowerShell, Forem.com having their newest articles in a JSON format (API)
.ROLE
IT Professionals
.NOTES
Developer: ITNinja01
Date:    
Version: 0.0.1
#>

    if (-not (Test-Connection forem.com -Count 1 -Quiet)) {
        Write-Error "forem.com is not reachable. Please check your internet connection."
        Exit 1
    }

    Write-Host "Latest news from  🧑‍💻"

    #Carriage return to make it easier to read in the terminal
    $crlf = [Environment]::NewLine

    $Articles = Invoke-RestMethod -Uri ""

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