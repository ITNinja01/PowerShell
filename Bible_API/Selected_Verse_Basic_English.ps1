<#
.SYNOPSIS
A script to get a specific verse and translation from the Bible API.
.DESCRIPTION
This script prompts the user for a Bible verse and a translation, then retrieves and displays the requested verse using the Bible API.
.EXAMPLE
Enter the verse you want to see (e.g., 'john 3:16', 'jn 3:16', 'matt 25:31-33,46'): john 3: 16
Enter the translation you want to use (default is 'web')                          : bbe
#>

#User input for verse and translation
$verse = Read-Host "Enter the verse you want to see (e.g., 'john 3:16', 'jn 3:16', 'matt 25:31-33,46')"
$translation = 'bbe'

#API call to retrieve the requested verse

#This is very important the ? and = are required for the URI to to formatted correctly for it to parse the query correctly.
$middle = "?translation="

$API_Call = "https://bible-api.com/$Verse$middle$translation"
$bible_request = Invoke-RestMethod -Uri $API_Call

# Display the requested verse in a formatted list
$bible_request | Format-List reference, text, translation_name