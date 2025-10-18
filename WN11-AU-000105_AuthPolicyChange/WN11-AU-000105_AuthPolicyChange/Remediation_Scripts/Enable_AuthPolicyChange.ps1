<#  WN11-AU-000105 — Audit Policy Change: Authentication Policy Change (Success)
    Run elevated. Configures:
      - SCENoApplyLegacyAuditPolicy = 1 (force subcategory settings)
      - auditpol: Authentication Policy Change = Success: Enabled, Failure: Disabled
#>

# Admin check
$principal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Error "Run this script from an elevated PowerShell session (Run as Administrator)."
    exit 1
}

Write-Host "[*] Enforcing subcategory audit policy usage..."
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'SCENoApplyLegacyAuditPolicy' -PropertyType DWord -Value 1 -Force | Out-Null

Write-Host "[*] Enabling Policy Change → Authentication Policy Change (Success) ..."
& auditpol.exe /set /subcategory:"Authentication Policy Change" /success:enable /failure:disable | Out-Null

Write-Host "[*] GPUpdate (optional)"
try { & gpupdate.exe /force | Out-Null } catch {}

Write-Host "[*] Verifying effective settings:"
$ap = (& auditpol.exe /get /subcategory:"Authentication Policy Change") -join "`n"
Write-Host $ap

$force = (Get-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa').SCENoApplyLegacyAuditPolicy
Write-Host ("SCENoApplyLegacyAuditPolicy = {0}" -f $force)

# Exit 0 if Success is enabled and force=1
if ($ap -match 'Success\s*:\s*Enabled' -and $force -eq 1) { exit 0 } else { exit 1 }
