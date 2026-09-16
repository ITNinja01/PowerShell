# Retrieve BBC Technology Latest News using BBC News API

$bbclatestapi= Invoke-RestMethod -Uri  'https://bbc-news-api.vercel.app/latest?lang=english' 
$bbclatestapi.Technology| Select-Object title, news_link | Sort-Object title | Format-List