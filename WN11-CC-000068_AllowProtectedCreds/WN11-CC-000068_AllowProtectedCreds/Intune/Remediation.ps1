# Intune Remediation — WN11-CC-000068
$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation'
$Name = 'AllowProtectedCreds'
New-Item -Path $Path -Force | Out-Null
New-ItemProperty -Path $Path -Name $Name -PropertyType DWord -Value 1 -Force | Out-Null
