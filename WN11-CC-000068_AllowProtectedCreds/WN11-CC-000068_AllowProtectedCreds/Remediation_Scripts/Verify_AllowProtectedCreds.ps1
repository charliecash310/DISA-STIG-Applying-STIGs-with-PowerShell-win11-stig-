<# Verify WN11-CC-000068
    Exit 0 = Compliant (value 1), 1 = Non-compliant
#>
$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation'
$Name = 'AllowProtectedCreds'
try {
  $val = (Get-ItemProperty -Path $Path -Name $Name -ErrorAction Stop).$Name
  Write-Output ("{0}\{1} = {2}" -f $Path, $Name, $val)
  if ($val -eq 1) { exit 0 } else { exit 1 }
} catch {
  Write-Output ("{0}\{1} not present" -f $Path, $Name)
  exit 1
}
