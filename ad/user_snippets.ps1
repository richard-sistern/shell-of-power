.<#
.SYNOPSIS
  AD user object snippets

.DESCRIPTION

.OUTPUTS

.EXAMPLE

.LINK

#>


# Simple export of active mailboxes
Get-Aduser -Properties mail, description, office -filter {enabled -eq $true -and mail -like '*'} |
    Select-Object GivenName, Surname, Mail, Description, Office |
        Export-Csv c:\temp\ad_mailboxes.csv
