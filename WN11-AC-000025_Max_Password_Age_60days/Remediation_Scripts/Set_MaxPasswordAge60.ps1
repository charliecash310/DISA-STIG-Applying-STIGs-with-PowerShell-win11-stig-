<# WN11-AC-000025 — Set Maximum Password Age ≤ 60 days #>
Write-Host "[*] Setting Maximum Password Age to 60 days..."
net accounts /maxpwage:60 | Out-Null
Write-Host "[+] Current policy:"
net accounts
