# Retrieve BBC Technology News using BBC News API

$bbcnewsapi = Invoke-RestMethod -Uri  'https://bbc-news-api.vercel.app/news?lang=english' 
$bbcnewsapi.Technology | Select-Object title, news_link | Sort-Object title | Format-List