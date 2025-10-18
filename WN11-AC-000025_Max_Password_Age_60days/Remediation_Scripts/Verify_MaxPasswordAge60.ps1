<# Verify WN11-AC-000025 compliance (exit 0 = compliant) #>
$line = (net accounts | Select-String -Pattern "Maximum password age").ToString()
$val = [int](([regex]::Match($line, '\d+')).Value)
if ($val -le 60 -and $val -ne 0) {
  Write-Host "Compliant — Maximum password age is $val day(s)."
  exit 0
} else {
  Write-Host "Non-compliant — Maximum password age is $val day(s)."
  exit 1
}
