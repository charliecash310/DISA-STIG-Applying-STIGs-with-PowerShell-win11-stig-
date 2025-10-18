<#  WN11-CC-000068 — Remote host allows delegation of non-exportable credentials
    Sets HKLM\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation\AllowProtectedCreds = 1
#>

# Admin check
$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Run this script from an elevated PowerShell session (Run as Administrator)."
    exit 1
}

$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation'
$Name = 'AllowProtectedCreds'

Write-Host "[*] Enabling delegation of non-exportable credentials..."
New-Item -Path $Path -Force | Out-Null
New-ItemProperty -Path $Path -Name $Name -PropertyType DWord -Value 1 -Force | Out-Null

try { & gpupdate.exe /force | Out-Null } catch {}

$val = (Get-ItemProperty -Path $Path -Name $Name).$Name
Write-Host ("AllowProtectedCreds = {0}" -f $val)
if ($val -eq 1) { exit 0 } else { exit 1 }
