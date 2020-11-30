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
