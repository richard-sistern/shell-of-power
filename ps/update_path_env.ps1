.<#
.SYNOPSIS
  Add something to the path environment variable
#>

$path = [Environment]::GetEnvironmentVariable('Path', 'Machine') + ';C:\folder'
[Environment]::SetEnvironmentVariable("Path", $path, 'Machine')
