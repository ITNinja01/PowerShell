function Get-ChuckNorrisJoke {
    $Joke = invoke-restMethod -Uri 'https://api.chucknorris.io/jokes/random' | select value -ExpandProperty value
    write-host "Chuck Norris Joke: $Joke"
}
function Get-ChuckNorrisJokeByCategory {
    # Define the valid categories
    $validCategories = @('animal', 'career', 'celebrity', 'dev', 'explicit', 'fashion', 'food', 'history', 'money', 'movie', 'music', 'political', 'religion', 'science', 'sport', 'travel')

    # Prompt the user for a category
    $Category = Read-Host "Enter a category (Valid categories: $($validCategories -join ', '))"

    # Validate the input
    if ($validCategories -notcontains $Category) {
        Write-Host "Invalid category. Please choose from the valid categories: $($validCategories -join ', ')" -ForegroundColor Red
        Get-ChuckNorrisJokeByCategory
    }

    # Fetch and display the joke
    $Joke = Invoke-RestMethod -Uri "https://api.chucknorris.io/jokes/random?category=$Category" | Select-Object -ExpandProperty value
    Write-Host "Chuck Norris Joke from category '$Category': $Joke"
}