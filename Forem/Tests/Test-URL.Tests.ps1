BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

$URLs = @('core.forem.com',
    'crypto.forem.com',
    'dev.to',
    'dumb.dev.to',
    'design.forem.com',
    'forem.com',
    'gg.forem.com',
    'golf.forem.com',
    'hmpljs.forem.com',
    'maker.forem.com',
    'music.forem.com',
    'open.forem.com',
    'parenting.forem.com',
    'popcorn.forem.com',
    'scale.forem.com',
    'vibe.forem.com',
    'zeroday.forem.com'
)

Describe "Test-URL" {
    Context "URL must be reachable for script to work properly" {
    }
    It "Returns findings for reachable URL" -TestCases ($URLs | ForEach-Object { @{ TargetName = $_ } }) {
        param($TargetName)
        Test-URL -TargetName $TargetName | Should -Be $true
    }
}