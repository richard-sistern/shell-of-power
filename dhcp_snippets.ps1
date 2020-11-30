.<#
.SYNOPSIS
  Snippets for managing DHCP servers

.DESCRIPTION


.OUTPUTS

.EXAMPLE

.LINK

#>

# List DHCP servers in AD
Get-DhcpServerInDC

# Set the DHCP server FQDN
[string] $dhcp_server = "dhcp.server.fqdn"

# List existing scopes
Get-DhcpServerv4Scope -ComputerName $dhcp_server

# List server level options
Get-DhcpServerv4OptionValue -ComputerName $dhcp_server

# Show scope statistics
Get-DhcpServerv4ScopeStatistics -ComputerName $dhcp_server

# List options for each scope
$scopes = Get-DhcpServerv4Scope -ComputerName $dhcp_server
Foreach ($scope in $scopes)
{
  "$($scope.Name) ($($scope.ScopeId))"
  Get-DhcpServerv4OptionValue -ComputerName $dhcp_server -Scope $scope.ScopeId
}

# Remove a specific option from a scope
Remove-DhcpServerv4OptionValue -ComputerName $dhcp_server -ScopeId 10.10.10.0 -OptionId 44
