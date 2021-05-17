<#
.SYNOPSIS
  Migrate specific AD computers from one group to another.

.DESCRIPTION
  A simple script to remove specific computers from one group and add them to another.

  $config.Input.Path    Text file of computer names
  $config.Groups.From   DN of group to remove computers from
  $config.Groups.To     DN of group to add computers to
#>

param (
    $configFilePath = $PSCommandPath.Replace('.ps1', '.json')
)

# Test for config file
if (Test-Path $configFilePath) {
    $config = Get-Content $configFilePath | ConvertFrom-Json
}
else {
    throw "Unable to locate config file $configFilePath"
}

# Test for input file
$inputFilePath = $config.Input.Path
if (Test-Path $inputFilePath) {
    $servers = Get-Content $inputFilePath
}
else {
    throw "Unable to locate input file $inputFilePath"
}

# Enumerate each server in input file
# Remove FROM group ($config.Groups.From)
# Add TO group ($config.Groups.To)
ForEach ($name in $servers) {
    $name = $name.Trim()

    $server = Get-ADComputer -filter { Name -like $name }
    if ($server) {
        Write-Host $server
        Remove-ADGroupMember -Identity $config.Groups.From -Members $server -Confirm:$False
        Add-ADGroupMember -Identity $config.Groups.To -Members $server -Confirm:$False
    }
}
