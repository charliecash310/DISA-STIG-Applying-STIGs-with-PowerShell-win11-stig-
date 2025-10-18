<# WN11-AC-000015 - Set Reset Account Lockout Counter to 15 minutes #>
Write-Host "[*] Setting lockout counter reset time to 15 minutes..."
net accounts /lockoutwindow:15
Write-Host "[+] Lockout reset time configured to 15 minutes."
