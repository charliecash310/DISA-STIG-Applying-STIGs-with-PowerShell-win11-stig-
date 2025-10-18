<# Intune Detection - WN11-AC-000035 #>
$result = net accounts | findstr /I "Minimum password length"
if ($result -match "14") { exit 0 } else { exit 1 }
