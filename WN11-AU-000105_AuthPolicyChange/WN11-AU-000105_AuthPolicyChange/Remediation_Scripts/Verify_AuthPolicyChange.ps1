<# Verification for WN11-AU-000105
    Exit 0 = Compliant, 1 = Non-compliant
#>
$report = (& auditpol.exe /get /subcategory:"Authentication Policy Change") -join "`n"
$force  = (Get-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -ErrorAction SilentlyContinue).SCENoApplyLegacyAuditPolicy

Write-Output $report
Write-Output ("SCENoApplyLegacyAuditPolicy = {0}" -f $force)

if ($report -match 'Success\s*:\s*Enabled' -and $force -eq 1) { exit 0 } else { exit 1 }
