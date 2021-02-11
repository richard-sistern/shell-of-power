<#
.SYNOPSIS
  Wrapper for VDesk

.DESCRIPTION
  Eumerates provided <args> and attempts find a corresponding hash of commands
  to load within VDesk

.EXAMPLE
  .\vdesk.ps1 COMMS

  vdesk run:notepad.exe launches Notepad on a new virtual desktop
  vdesk on:3 run:notepad c:\text.txt opens Notepad on virtual desktop 3 and uses an argument to load text.txt automatically.

.LINK
  Requires VDesk from https://github.com/eksime/VDesk/releases/
#>

$COMMS = @{
  "Teams" = "$env:USERPROFILE\AppData\Local\Microsoft\Teams\current\Teams.exe"
  "Outlook" = "${Env:ProgramFiles(x86)}\Microsoft Office\Office16\Outlook.exe"
}

# +1 : Count from 1 rather than 0
# +1 : Keep first virtual desktop clear
$offset = 2

Foreach ($arg in $args)
{
  if ($commands = Get-Variable $arg -ValueOnly -ErrorAction SilentlyContinue) {
    $target = $args.IndexOf($arg) + $offset

    Foreach ($command in $commands.GetEnumerator())
    {
      Write-Output "Starting $($command.Name)"
      Start-Process "vdesk" -ArgumentList "on:$($target) run:`"$($command.Value)`""
    }
  }
}
