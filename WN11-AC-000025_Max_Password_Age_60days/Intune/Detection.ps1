# Intune Detection — WN11-AC-000025
$line = (net accounts | Select-String -Pattern "Maximum password age").ToString()
$val = [int](([regex]::Match($line, '\d+')).Value)
if ($val -le 60 -and $val -ne 0) { exit 0 } else { exit 1 }
