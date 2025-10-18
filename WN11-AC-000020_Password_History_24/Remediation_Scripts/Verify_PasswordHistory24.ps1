<# Verify WN11-AC-000020 compliance (exit 0 = compliant) #>
$text = (net accounts) -join "`n"
$line = ($text | Select-String -Pattern "history|unique" -SimpleMatch).ToString()
$val = [int](([regex]::Match($line, '\d+')).Value)
if ($val -ge 24) {
  Write-Host "Compliant — Password history is $val (>=24)."
  exit 0
} else {
  Write-Host "Non-compliant — Password history is $val (<24)."
  exit 1
}
