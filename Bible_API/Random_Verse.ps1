$bible_request = Invoke-RestMethod -Uri https://bible-api.com/data/web/random

$bible_request.random_verse | select book, text | fl
