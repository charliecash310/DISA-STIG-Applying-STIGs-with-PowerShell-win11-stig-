<#  WN11-CC-000090 — GPO reprocess even if unchanged
    Sets HKLM\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}\NoGPOListChanges = 0
#>

# Admin check
$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Run this script from an elevated PowerShell session (Run as Administrator)."
    exit 1
}

$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}'
$Name = 'NoGPOListChanges'

Write-Host "[*] Enabling registry policy reprocessing each refresh..."
New-Item -Path $Path -Force | Out-Null
New-ItemProperty -Path $Path -Name $Name -PropertyType DWord -Value 0 -Force | Out-Null

Write-Host "[*] gpupdate (optional)"
try { & gpupdate.exe /force | Out-Null } catch {}

# Verify and exit code
$val = (Get-ItemProperty -Path $Path -Name $Name).$Name
Write-Host ("NoGPOListChanges = {0}" -f $val)
if ($val -eq 0) { exit 0 } else { exit 1 }
