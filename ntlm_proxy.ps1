#https://kimconnect.com/powershell-winhttp-proxy/

# Method 1: Set PowerShell User Agent to be recognized by the proxy and authenticate via Default AD credential
$webClient = new-object System.Net.WebClient
$webClient.Headers.Add(“user-agent”, “PowerShell Script”)
$webClient.Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials

# Method 2: Run 1-off Web Request commands
$Proxy = "http://proxy:80"
$Password = ConvertTo-SecureString "PASSWORD" -AsPlainText -Force
$Credentials = New-Object System.Management.Automation.PSCredential -ArgumentList "DOMAIN\ADMINISTRATOR",$Password
Invoke-WebRequest -uri https://google.com -Proxy $Proxy -ProxyCredential $Credentials

# Method 3: NO Basic Auth. copy proxy address from http proxy to winhttp
$proxy = [System.Net.WebProxy]::GetDefaultProxy().Address
[system.net.webrequest]::defaultwebproxy = New-Object system.net.webproxy($proxy)
[system.net.webrequest]::defaultwebproxy.credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials
[system.net.webrequest]::defaultwebproxy.BypassProxyOnLocal = $true

# Method 4: [YES] Basic Auth. copy proxy address from http proxy to winhttp
$proxy = [System.Net.WebProxy]::GetDefaultProxy().Address
[system.net.webrequest]::defaultwebproxy = New-Object system.net.webproxy($proxy)
$credCache = [System.Net.CredentialCache]::new()
$credentials = [System.Net.NetworkCredential]::new("USERNAME","PASSWORD","KIMCONNECT")
$credCache.Add($proxy, "Basic", $credentials)
