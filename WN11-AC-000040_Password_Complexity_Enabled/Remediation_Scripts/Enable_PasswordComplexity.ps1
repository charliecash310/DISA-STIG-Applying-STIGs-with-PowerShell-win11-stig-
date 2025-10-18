<# WN11-AC-000040 - Enable Password Complexity Requirement #>
Write-Host "[*] Enabling password complexity requirements..."
secedit /export /cfg C:\secpol.cfg
(Get-Content C:\secpol.cfg) -replace 'PasswordComplexity = 0', 'PasswordComplexity = 1' | Set-Content C:\secpol.cfg
secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg C:\secpol.cfg /areas SECURITYPOLICY
Remove-Item C:\secpol.cfg -Force
Write-Host "[+] Password complexity has been enabled."
