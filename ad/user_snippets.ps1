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
# Note: Add-ADGroupMember does not accept pipeline input
$group = Get-ADGroup "Name of group"
$user = Get-ADUser -filter { UserPrincipalName -eq "Name of user" }
Add-ADGroupMember $group -Members $user

# Retrieve account SID
Get-Aduser user_name | Select Name, SID
