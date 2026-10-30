<#
.SYNOPSIS
A simple script to get a random verse from the Bible API.
#>

$BibleRequest = Invoke-RestMethod -Uri https://bible-api.com/data/web/random
$BibleRequest.random_verse | Format-List book, chapter, verse, text