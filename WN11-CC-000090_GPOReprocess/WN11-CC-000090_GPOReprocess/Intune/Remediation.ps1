# Intune Remediation — WN11-CC-000090
$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}'
$Name = 'NoGPOListChanges'
New-Item -Path $Path -Force | Out-Null
New-ItemProperty -Path $Path -Name $Name -PropertyType DWord -Value 0 -Force | Out-Null
