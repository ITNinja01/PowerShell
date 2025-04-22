function get-ChuckNorrisJoke {
    $Joke = invoke-restMethod -Uri 'https://api.chucknorris.io/jokes/random' | select value -ExpandProperty value
    write-host "Chuck Norris Joke: $Joke"
}
function get-ChuckNorrisJokeCategory {
    invoke-restMethod -Uri 'https://api.chucknorris.io/jokes/categories' | ForEach-Object { write-host "Category: $_" }
    [Parameter(Mandatory=$true)]
    [ValidateSet('animal', 'career', 'celebrity', 'dev', 'explicit', 'fashion', 'food', 'history', 'money', 'movie', 'music', 'political', 'religion', 'science', 'sport', 'travel')]
    [string]$ChooseCategory = $null
    $Joke = invoke-restMethod -Uri "https://api.chucknorris.io/jokes/random?category=$ChooseCategory" | select value -ExpandProperty value
    if ($Joke) {
        write-host "Chuck Norris Joke from category '$ChooseCategory': $Joke"
    } else {
        write-host "No joke found for category '$ChooseCategory'."
}
}

