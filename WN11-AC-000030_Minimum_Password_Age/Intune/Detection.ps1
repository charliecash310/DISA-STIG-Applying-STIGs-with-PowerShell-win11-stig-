# Intune Detection — WN11-AC-000030
$line = (net accounts | Select-String -Pattern "Minimum password age").ToString()
$val = [int](([regex]::Match($line, '\d+')).Value)
if ($val -ge 1) { exit 0 } else { exit 1 }
