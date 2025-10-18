# Intune Detection — WN11-CC-000090
$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}'
$Name = 'NoGPOListChanges'
$val = (Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue).$Name
if ($val -eq 0) { exit 0 } else { exit 1 }
