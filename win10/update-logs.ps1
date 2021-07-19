# Create a single .log from Windows Update .etl files

Get-WindowsUpdateLog

# Flush all current traces into the log file.  Temporarily stops the Update Orchestrator and Windows Update services
Get-WindowsUpdateLog -ForceFlush # Run as admin
