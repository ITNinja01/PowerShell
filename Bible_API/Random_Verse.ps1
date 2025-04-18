<#
.SYNOPSIS
A simple script to get a random verse from the Bible API.
#>

$bible_request = Invoke-RestMethod -Uri https://bible-api.com/data/web/random
$bible_request.random_verse | Format-List book, chapter, verse, text