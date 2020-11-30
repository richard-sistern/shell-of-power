.<#
.SYNOPSIS
  Calculate Active Directory Site Link Cost

.DESCRIPTION
  Assign cost values to site links to favour inexpensive (bandwidth, latency, monetary, reliability) connections
  This computed cost should serve as a starting point as only bandwidth is considered

.OUTPUTS
  [double]  Double-precision 64-bit floating point number

.EXAMPLE
  1024 / log(8192) = 262 (rounded to the nearest whole number)

.LINK
  https://docs.microsoft.com/en-us/windows-server/identity/ad-ds/plan/determining-the-cost
  https://4sysops.com/archives/do-the-math-with-powershell/
  http://www.itgeared.com/articles/1043-determine-what-is-appropriate-active/
#>

$bandwidth = Read-Host -Prompt 'Input link bandwidth (Kpbs)'
$cost = 1024 / [Math]::Log10($bandwidth)
[Math]::Round($cost)
