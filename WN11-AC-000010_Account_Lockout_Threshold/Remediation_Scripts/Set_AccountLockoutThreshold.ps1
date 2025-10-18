<# WN11-AC-000010 - Configure Account Lockout Threshold #>

Write-Host "[*] Configuring Account Lockout Threshold to 3 invalid attempts..."
net accounts /lockoutthreshold:3 | Out-Null

Write-Host "[+] Configuration applied successfully. Run 'net accounts' to verify."
