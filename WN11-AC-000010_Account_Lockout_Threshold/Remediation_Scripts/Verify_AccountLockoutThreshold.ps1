<# Verify WN11-AC-000010 Compliance #>

$lockout = (net accounts | Select-String "Lockout threshold").ToString()
if ($lockout -match "3") {
    Write-Host "Compliant — Account Lockout Threshold is set to 3 invalid attempts."
    exit 0
} else {
    Write-Host "Non-compliant — Lockout threshold not properly configured."
    exit 1
}
