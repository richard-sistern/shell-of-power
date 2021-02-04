.<#
.SYNOPSIS
  Add something to the path environment variable
#>

# Show current PATH
[Environment]::GetEnvironmentVariable('Path', 'Machine') 

# Update PATH
$path = [Environment]::GetEnvironmentVariable('Path', 'Machine') + ';C:\folder'
[Environment]::SetEnvironmentVariable("Path", $path, 'Machine')
