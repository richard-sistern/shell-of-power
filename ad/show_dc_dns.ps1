.<#
.SYNOPSIS
  Show local DNS for every domain controller in a forest

.DESCRIPTION
  Enumerate availible forests and domain servers then display the DNS settings for each server

.OUTPUTS
  host.domain.com
  10.10.10.1
  10.10.10.2

.EXAMPLE

.LINK

#>

$servers = (Get-ADForest).Domains | %{ Get-ADDomainController -Filter * -Server $_ } | Select HostName

Foreach ($server in $servers)
{
  $server = $server.HostName
  $server
  Get-WmiObject -Namespace root\cimv2 -Query "Select dnsserversearchorder from win32_networkadapterconfiguration" -ComputerName $server | Where {$_.DNSServerSEarchOrder -ne $null} | Select -ExpandProperty DNSServerSearchOrder
}
