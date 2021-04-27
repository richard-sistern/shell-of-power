# Example from Jeffrey Snover
# Running multiple scripts in-process without having them interefere with on another
# https://twitter.com/jsnover/status/1386749721453031424
# https://docs.microsoft.com/en-us/powershell/scripting/developer/hosting/adding-and-invoking-commands?view=powershell-7.1

$sb = @'
    if (!${global:x})
    {
        ${global:x} = Get-Date
    }
    ${global:x}
'@

# Runspaces provide you a great deal of control so if this doesn't do exactly
# what you want, investigate.  I can assure you, it can do whatever you want to do.
$Runspace = [runspacefactory]::CreateRunspace()
$PowerShell = [powershell]::Create()
$PowerShell.Runspace = $Runspace
$Runspace.Open()

[void]$PowerShell.AddScript($sb)
$PowerShell.Invoke()
Start-Sleep -Seconds 2
# Notice that the time does not change!
# That is because we didn't reset the runspace which means that global:x
# is still set so we just reuse it
$PowerShell.Invoke()

# Notice that now the time does change
$Runspace.ResetRunspaceState()
Start-Sleep -Seconds 2
$PowerShell.Invoke()

