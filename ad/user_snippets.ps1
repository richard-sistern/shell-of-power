.<#
.SYNOPSIS
  AD user object snippets

.DESCRIPTION

.OUTPUTS

.EXAMPLE

.LINK

#>


# Simple export of active mailboxes
Get-Aduser -Properties mail, description, office -Filter {enabled -eq $true -and mail -like '*'} |
    Select-Object GivenName, Surname, Mail, Description, Office |
        Export-Csv c:\ad_mailboxes.csv

# Add user to a group
$group = Get-ADGroup "Name of group"
$user = Get-ADUser -filter { UserPrincipalName -eq "Name of user" }
Add-ADGroupMember $group -Members $user

# Note: Add-ADGroupMember does not accept pipeline input



