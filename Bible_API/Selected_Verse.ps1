<#
.SYNOPSIS
A script to get a specific verse and translation from the Bible API.
.DESCRIPTION
This script prompts the user for a Bible verse and a translation, then retrieves and displays the requested verse using the Bible API.
.EXAMPLE
Enter the verse you want to see (e.g., 'john 3:16', 'jn 3:16', 'matt 25:31-33,46'): john 3: 16
Enter the translation you want to use (default is 'web'): bbe
#>

#Translations in custom PS object format to be disayed to the user as a table
$translations = @(
    [PSCustomObject]@{ language	= "Cherokee"; name = "Cherokee New Testament"; identifier = "cherokee" }
    [PSCustomObject]@{ language	= "Chinese"; name = "Chinese Union Version"; identifier = "cuv" }
    [PSCustomObject]@{ language	= "Czech"; name = "Bible kralická"; identifier = "bkr" }
    [PSCustomObject]@{ language	= "English"; name = "American Standard Version (1901)"; identifier = "asv" }   
    [PSCustomObject]@{ language	= "English"; name = "Bible in Basic English"; identifier = "bbe" }
    [PSCustomObject]@{ language	= "English"; name = "Darby Bible"; identifier = "darby" }   
    [PSCustomObject]@{ language	= "English"; name = "Douay-Rheims 1899 American Edition"; identifier = "dra" }
    [PSCustomObject]@{ language	= "English"; name = "King James Version"; identifier = "kjv" }
    [PSCustomObject]@{ language	= "English"; name = "World English Bible"; identifier = "web" } # default
    [PSCustomObject]@{ language	= "English"; name = "Young's Literal Translation (NT only)"; identifier = "ylt" }
    [PSCustomObject]@{ language	= "English (UK)"; name = "Open English Bible, Commonwealth Edition"; identifier = "oeb-cw" }
    [PSCustomObject]@{ language	= "English (UK)"; name = "World English Bible, British Edition"; identifier = "webbe" }
    [PSCustomObject]@{ language	= "English (US)"; name = "Open English Bible, US Edition"; identifier = "oeb-us" }
    [PSCustomObject]@{ language	= "Latin"; name = "Clementine Latin Vulgate"; identifier = "clementine" }
    [PSCustomObject]@{ language	= "Portuguese"; name = "João Ferreira de Almeida"; identifier = "almeida" }
    [PSCustomObject]@{ language	= "Romanian"; name = "Protestant Romanian Corrected Cornilescu Version"; identifier = "rccv" }
)

# Convert the translations to a table format for display
$table = $translations | Format-Table

#Set the intro message with examples and supported translations
$Intro = @"
What bible verse would you like to see?
Examples of ways to ask for a verse

single verse 'john 3:16'

abbreviated book name 'jn 3:16'

'hyphen and comm 'matt 25:31-33,46'

Types of supported translations: 
"@

$Intro += $table | Out-String

Write-Host $Intro 


#User input for verse and translation
$verse       = Read-Host "Enter the verse you want to see (e.g., 'john 3:16', 'jn 3:16', 'matt 25:31-33,46')"
$translation = Read-Host "Enter the translation you want to use (default is 'web')"

# Check if the user provided a translation, if not, set it to 'web'
if (-not $translation) {
    $translation = "web"
}

#API call to retrieve the requested verse

#This is very important the ? and = are required for the URI to to formatted correctly for it to parse the query correctly.
      $middle                     = "?translation="

$API_Call      = "https://bible-api.com/$Verse$middle$translation"
$bible_request = Invoke-RestMethod -Uri $API_Call

# Display the requested verse in a formatted list
$bible_request | Format-List reference, text, translation_name