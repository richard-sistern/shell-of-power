Install-Module VSSetup -Scope CurrentUser -Force
(Get-VSSetupInstance | Select-VSSetupInstance -Product *).packages | Select-Object Id