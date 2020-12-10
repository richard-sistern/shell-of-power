<#
.SYNOPSIS
  Snippets for managing DNS servers and records

.DESCRIPTION


.OUTPUTS

.EXAMPLE

.LINK

#>

# Show a hosts DNS record
Get-DnsServerResourceRecord  -ZoneName "zone" -Name "host"

# Create an A record 
Add-DnsServerResourceRecord -ZoneName "zone" -A -Name "host" -IPv4Address "10.10.10.1"
