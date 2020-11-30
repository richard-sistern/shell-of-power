#Read only community string
$community_string = "bla"
$permitted_managers = @("host1", "host2")

#Check If SNMP Services Are Already Installed
$check = Get-WindowsFeature | Where-Object {$_.Name -eq "SNMP-Service"}
If ($check.Installed -ne "True") {
        #Install/Enable SNMP Services
        Add-WindowsFeature SNMP-Service | Out-Null
}

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SNMP\Parameters\ValidCommunities" /v $community_string /t REG_DWORD /d 4 /f | Out-Null

ForEach ($manager in $permitted_managers) {
  $i += 1
  reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\services\SNMP\Parameters\PermittedManagers" /v $i /t REG_SZ /d $manager /f | Out-Null
}
