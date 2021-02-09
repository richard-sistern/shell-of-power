# Search files for a string
Get-ChildItem 'c:\temp' -Filter *.txt | Get-Content | Select-String -Pattern 'FINDME'

# Replace text in multiple files
Get-ChildItem 'c:\temp' -Filter *.txt  | ForEach { (Get-Content $_ | ForEach {$_ -replace "old", "new"}) | Set-Content $_ }
