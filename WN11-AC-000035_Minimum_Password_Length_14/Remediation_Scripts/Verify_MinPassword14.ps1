<# Verify WN11-AC-000035 Compliance #>
$result = net accounts | findstr /I "Minimum password length"
if ($result -match "14") {
    Write-Host "Compliant — Minimum password length is 14 characters."
    exit 0
} else {
    Write-Host "Non-compliant — Minimum password length not set to 14."
    exit 1
}
