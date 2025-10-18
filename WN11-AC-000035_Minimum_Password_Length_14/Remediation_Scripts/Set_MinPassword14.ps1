<# WN11-AC-000035 - Set Minimum Password Length to 14 Characters #>
Write-Host "[*] Setting minimum password length to 14 characters..."
net accounts /minpwlen:14
Write-Host "[+] Minimum password length configured to 14 characters."
