.<#
.SYNOPSIS
  Helpful PowerShell Module Snippets
#>

# Where is a module installed
(Get-Module -ListAvailable ActiveDirectory*).path

# To resolve the following error when running Install-Module -name <name>
# WARNING: Unable to resolve package source 'https://www.powershellgallery.com/api/v2'.
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Sometimes have to use
$webclient=New-Object System.Net.WebClient
$webclient.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
[Net.ServicePointManager]::SecurityProtocol = "tls12"
