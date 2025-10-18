# Intune Detection — WN11-CC-000068
$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation'
$Name = 'AllowProtectedCreds'
$val = (Get-ItemProperty -Path $Path -Name $Name -ErrorAction SilentlyContinue).$Name
if ($val -eq 1) { exit 0 } else { exit 1 }
