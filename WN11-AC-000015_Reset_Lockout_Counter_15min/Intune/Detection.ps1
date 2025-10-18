<# Intune Detection - WN11-AC-000015 #>
$result = net accounts | findstr /I "Lockout observation window"
if ($result -match "15") { exit 0 } else { exit 1 }
