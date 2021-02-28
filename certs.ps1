# Set location to the local machine certificate store
Set-Location Cert:\LocalMachine\My

# Set location to the user certificate store
Set-Location Cert:\CurrentUser\My

# List certificates at that location
Get-ChildItem | Format-Table Subject, FriendlyName, Thumbprint -AutoSize

# Perform on a remote computer
$Server = "hostname"
$Certs = Invoke-Command -Computername $Server -Scriptblock {Get-ChildItem "Cert:\LocalMachine\My"}
