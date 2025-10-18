# Intune Proactive Remediations — Remediation for WN11-AU-000105
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' -Name 'SCENoApplyLegacyAuditPolicy' -PropertyType DWord -Value 1 -Force | Out-Null
auditpol.exe /set /subcategory:"Authentication Policy Change" /success:enable /failure:disable | Out-Null
