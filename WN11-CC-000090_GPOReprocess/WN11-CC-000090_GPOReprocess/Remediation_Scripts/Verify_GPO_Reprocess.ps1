<# Verification for WN11-CC-000090
    Exit 0 = Compliant (value 0), 1 = Non-compliant
#>
$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}'
$Name = 'NoGPOListChanges'

try {
  $val = (Get-ItemProperty -Path $Path -Name $Name -ErrorAction Stop).$Name
  Write-Output ("{0}\{1} = {2}" -f $Path, $Name, $val)
  if ($val -eq 0) { exit 0 } else { exit 1 }
} catch {
  Write-Output ("{0}\{1} not present" -f $Path, $Name)
  exit 1
}
