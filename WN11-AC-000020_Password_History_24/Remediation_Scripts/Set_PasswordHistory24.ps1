<# WN11-AC-000020 — Set Enforce Password History = 24 #>
Write-Host "[*] Setting Enforce password history to 24 passwords remembered..."
net accounts /uniquepw:24 | Out-Null
Write-Host "[+] Current policy:"
net accounts
