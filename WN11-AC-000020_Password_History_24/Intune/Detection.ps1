# Intune Detection — WN11-AC-000020
$text = (net accounts) -join "`n"
$line = ($text | Select-String -Pattern "history|unique" -SimpleMatch).ToString()
$val = [int](([regex]::Match($line, '\d+')).Value)
if ($val -ge 24) { exit 0 } else { exit 1 }
