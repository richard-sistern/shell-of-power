$Password = ConvertTo-SecureString -String "Pa55w0rd" -AsPlainText -Force
New-LocalUser "username" -Password $Password -FullName "User Name" -Description "Description of this account."
Add-LocalGroupMember -Group "Administrators" -Member "username"