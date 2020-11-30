.<#
.SYNOPSIS
  AD computer object snippets

.DESCRIPTION

.OUTPUTS

.EXAMPLE

.LINK

#>

# Show count of Windows server OS
Get-ADComputer -Filter { Enabled -eq $True -and OperatingSystem -Like '*Windows Server*' } -Properties OperatingSystem | Select OperatingSystem | Group-Object -Property OperatingSystem | Select Name, Count | Sort Name
