#Read only community string
$community_string = "bla"

#Check If SNMP Services Are Already Installed
$check = Get-WindowsFeature | Where-Object {$_.Name -eq "SNMP-Services"}
If ($check.Installed -ne "True") {
        #Install/Enable SNMP Services
        Add-WindowsFeature SNMP-Services | Out-Null
}


