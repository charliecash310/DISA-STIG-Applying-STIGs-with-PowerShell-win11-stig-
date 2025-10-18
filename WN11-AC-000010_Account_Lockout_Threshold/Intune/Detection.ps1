<# Intune Detection Script for WN11-AC-000010 #>
$lockout = (net accounts | Select-String "Lockout threshold").ToString()
if ($lockout -match "3") { exit 0 } else { exit 1 }
