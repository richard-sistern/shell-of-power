#Pester

[Pester](https://github.com/pester/Pester) is a mock and test framework for PowerShell

To generate a script and test scaffold
```PowerShell
New-Fixture -Name Furble

# Create: Furble.ps1
# Create: Furble.Tests.ps1
```

Run the tests
```PowerShell
Invoke-Pester
```
