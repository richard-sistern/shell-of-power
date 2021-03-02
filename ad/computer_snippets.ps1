.<#
.SYNOPSIS
  AD computer object snippets

.DESCRIPTION

.OUTPUTS

.EXAMPLE

.LINK

#>

# Show count of Windows Server OS
Get-ADComputer -Filter { Enabled -eq $True -and OperatingSystem -Like '*Windows Server*' } -Properties OperatingSystem | Select OperatingSystem | Group-Object -Property OperatingSystem | Select Name, Count | Sort Name

# List desktops with IP and last logon
Get-ADComputer -Filter { Enabled -eq $True -and OperatingSystem -notlike '*Windows Server*' } -Properties Name, Operatingsystem, OperatingSystemVersion, IPv4Address, LastLogonTimeStamp |
    Select Name, Operatingsystem, OperatingSystemVersion, IPv4Address, @{N='LastLogon'; E={[DateTime]::FromFileTime($_.LastLogonTimeStamp)}}
