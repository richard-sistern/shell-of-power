.<#
.SYNOPSIS
  Add something to the path environment variable
#>

$path = [Environment]::GetEnvironmentVariable('PSModulePath', 'Machine') + ';C:\folder'
[Environment]::SetEnvironmentVariable("PSModulePath", $path, 'Machine')
