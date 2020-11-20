#calculate the relative cost factor by dividing 1,024 by the log of the available bandwidth, as measured in Kbps.  For example, if the available bandwidth is 8192 Kbps, you would use the following formula --> 1024 / log(8192) = 262 (round to the nearest whole number)
#https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/plan/determining-the-cost
#https://4sysops.com/archives/do-the-math-with-powershell/
#http://www.itgeared.com/articles/1043-determine-what-is-appropriate-active/

$bw = Read-Host -Prompt 'Input link bandwith (Kpbs)'

$lc = 1024 / Math::Log10($bw)

Write-Host [math]::Round(lc)
