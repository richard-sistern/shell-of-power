.<#
.SYNOPSIS
  Perform analysis of disk errors and performance

.DESCRIPTION
  Check System event log for storage subsystem errors and group by month.  Looks for the following:
    Event:129 - Request timed out (storport driver)
    Event:153 - Request timed out (miniport driver)
.OUTPUTS

.EXAMPLE

.LINK
  https://askbob.tech/understanding-storage-timeouts-and-event-129-errors/
  https://askbob.tech/interpreting-event-153-errors/
#>

Get-WinEvent FilterHashtable @{logname="System"; id=129,153} | Group-Object {$_.TimeCreated.ToString("yyyy-MM")} | Select-Object Name, Count
