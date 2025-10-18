<# Intune Detection Script - WN11-AC-000005 #>
$line = (net accounts | Select-String "Lockout duration").ToString()
$val = [int](([regex]::Match($line, '\d+')).Value)
if ($val -ge 15 -or $val -eq 0) { exit 0 } else { exit 1 }
