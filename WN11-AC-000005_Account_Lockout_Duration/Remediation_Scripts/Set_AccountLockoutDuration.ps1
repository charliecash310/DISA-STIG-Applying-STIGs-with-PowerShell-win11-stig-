<# WN11-AC-000005 - Set Account Lockout Duration >= 15 minutes #>
Write-Host "[*] Configuring Account Lockout Duration to 15 minutes..."
net accounts /lockoutduration:15 | Out-Null
Write-Host "[+] Policy applied successfully. Run 'net accounts' to confirm."
