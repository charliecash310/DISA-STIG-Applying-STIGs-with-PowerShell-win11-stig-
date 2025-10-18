<# Verify WN11-AC-000040 Compliance #>
secedit /export /cfg C:\verify.cfg | Out-Null
$value = Select-String "PasswordComplexity" C:\verify.cfg
if ($value -match "1") {
    Write-Host "Compliant — Password complexity is enabled."
    Remove-Item C:\verify.cfg -Force
    exit 0
} else {
    Write-Host "Non-compliant — Password complexity not enabled."
    Remove-Item C:\verify.cfg -Force
    exit 1
}
