BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

$URLAPIs = @('core.forem.com/api/articles',
    'crypto.forem.com/api/articles',
    'dev.to/api/articles',
    'design.forem.com/api/articles',
    'dumb.dev.to/api/articles',
    'forem.com/api/articles',
    'gg.forem.com/api/articles',
    'golf.forem.com/api/articles',
    'hmpljs.forem.com/api/articles',
    'maker.forem.com/api/articles',
    'music.forem.com/api/articles',
    'open.forem.com/api/articles',
    'parenting.forem.com/api/articles',
    'popcorn.forem.com/api/articles',
    'scale.forem.com/api/articles',
    'vibe.forem.com/api/articles',
    'zeroday.forem.com/api/articles'
)
Describe "Test-API" {
    Context "The count will show the API is working properly" {
    }
    It "Returns count of articles from API"  -ForEach ($URLAPIs | ForEach-Object { @{ APIURI = $_ } }) {
        param($APIURI)
        Test-API -APIURI $APIURI | Should -Be $true
      
    }
}
