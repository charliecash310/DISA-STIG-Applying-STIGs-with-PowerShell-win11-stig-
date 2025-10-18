<# Verify WN11-AC-000015 Compliance #>
$result = net accounts | findstr /I "Lockout observation window"
if ($result -match "15") {
    Write-Host "Compliant — Lockout reset time is 15 minutes."
    exit 0
} else {
    Write-Host "Non-compliant — Lockout reset time not set to 15 minutes."
    exit 1
}
