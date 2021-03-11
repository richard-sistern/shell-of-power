BeforeAll {
    . $PSCommandPath.Replace('.Tests.ps1', '.ps1')
}

Describe "active-directory" {
    It "Returns expected output" {
        active-directory | Should -Be "YOUR_EXPECTED_VALUE"
    }
}
