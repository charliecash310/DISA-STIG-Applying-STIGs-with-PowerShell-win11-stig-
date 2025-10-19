<# Verify WN11-AC-000030 compliance (exit 0 = compliant) #>
$line = (net accounts | Select-String -Pattern "Minimum password age").ToString()
# Extract digits; treat blank as 0
$val = [int](([regex]::Match($line, '\d+')).Value)
if ($val -ge 1) { 
  Write-Host "Compliant — Minimum password age is $val day(s)."
  exit 0 
} else { 
  Write-Host "Non-compliant — Minimum password age is $val day(s)."
  exit 1 
}
