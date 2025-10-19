<# WN11-AC-000030 — Set Minimum Password Age >= 1 day #>
Write-Host "[*] Setting Minimum Password Age to 1 day..."
net accounts /minpwage:1 | Out-Null
Write-Host "[+] Current policy:"
net accounts
