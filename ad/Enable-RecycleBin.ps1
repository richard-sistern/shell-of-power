# Check current status
Get-ADOptionalFeature "Recycle Bin Feature" | Select-Object name, enabledscopes

# Enable recycle bin
Enable-ADOptionalFeature "Recycle Bin Feature" -Scope ForestOrConfigurationSet -Target <forest root domain name>
