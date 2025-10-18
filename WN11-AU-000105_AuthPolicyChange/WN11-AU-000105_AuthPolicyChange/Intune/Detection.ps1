# Intune Proactive Remediations — Detection for WN11-AU-000105
$report = (& auditpol.exe /get /subcategory:"Authentication Policy Change") -join "`n"
$force  = (Get-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -ErrorAction SilentlyContinue).SCENoApplyLegacyAuditPolicy
if ($report -match 'Success\s*:\s*Enabled' -and $force -eq 1) { exit 0 } else { exit 1 }
