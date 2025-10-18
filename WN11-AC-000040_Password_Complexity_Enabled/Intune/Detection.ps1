<# Intune Detection - WN11-AC-000040 #>
secedit /export /cfg C:\verify.cfg | Out-Null
$value = Select-String "PasswordComplexity" C:\verify.cfg
if ($value -match "1") { Remove-Item C:\verify.cfg -Force; exit 0 } else { Remove-Item C:\verify.cfg -Force; exit 1 }
