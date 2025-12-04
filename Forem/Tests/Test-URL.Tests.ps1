BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

$URLs = @("google.com", "facebook.com")

Describe "Test-URL" {
    It "Returns findings for reachable URL" -TestCases ($URLs | ForEach-Object { @{ TargetName = $_ } }) {
        param($TargetName)
        Test-URL -TargetName $TargetName | Should -Be $true
    }
}
