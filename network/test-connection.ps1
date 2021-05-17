# RDP
Test-NetConnection -ComputerName <IP/Name> -Port 3389 -InformationLevel 'Detailed'

# RDP (alternative)
# CommonTCPPort values: HTTP, RDP, SMB, WINRM
Test-NetConnection -ComputerName <IP/Name> -CommonTCPPort RDP
