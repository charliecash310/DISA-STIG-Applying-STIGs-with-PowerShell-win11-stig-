<# Verify WN11-AC-000005 Compliance #>
$line = (net accounts | Select-String "Lockout duration").ToString()
$val = [int](([regex]::Match($line, '\d+')).Value)
if ($val -ge 15 -or $val -eq 0) {
    Write-Host "Compliant — Lockout duration is $val minute(s)."
    exit 0
} else {
    Write-Host "Non-compliant — Lockout duration is $val minute(s)."
    exit 1
}
