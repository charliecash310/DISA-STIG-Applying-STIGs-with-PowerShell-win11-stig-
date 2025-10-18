# 🛡️ Windows 11 STIG Remediation: Audit Policy Change — Authentication Policy Change (Success)

**STIG ID:** WN11-AU-000105  
**Vuln ID:** V-253326  
**Severity:** Medium  
**CCI:** CCI-000172  
**SRG:** SRG-OS-000462-GPOS-00206  
**Updated:** 2025-10-07 04:18:52Z

Enable Advanced Audit Policy to record **Authentication Policy Change** events (e.g., Kerberos policy and trust changes).  
This produces a reliable trail in the **Security** log for investigating configuration changes and potential attacks.

---

## 🔍 What the scanner checks

- **Advanced Audit Policy** subcategory:  
  **Policy Change → Audit Authentication Policy Change** = **Success: Enabled**
- Advanced audit subcategories are **in effect**:  
  `HKLM\SYSTEM\CurrentControlSet\Control\Lsa\SCENoApplyLegacyAuditPolicy = 1`

If either condition is not met, it’s a finding.

---

## ⚡ Quick Remediation (PowerShell — run as Administrator)

```powershell
# 1) Ensure subcategory audit policy overrides legacy category policy
New-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa' `
  -Name 'SCENoApplyLegacyAuditPolicy' -PropertyType DWord -Value 1 -Force | Out-Null

# 2) Enable Authentication Policy Change (Success only per STIG)
auditpol.exe /set /subcategory:"Authentication Policy Change" /success:enable /failure:disable

# 3) Verify
auditpol.exe /get /subcategory:"Authentication Policy Change"
(Get-ItemProperty 'HKLM:\SYSTEM\CurrentControlSet\Control\Lsa').SCENoApplyLegacyAuditPolicy
```

**Expected result:**
- `Success : Enabled`
- `SCENoApplyLegacyAuditPolicy = 1`

---

## 🖱️ GUI Method (No scripting)

### A) Make subcategory auditing effective
1. `Win + R` → `secpol.msc`  
2. **Security Settings → Local Policies → Security Options**  
3. Set **Audit: Force audit policy subcategory settings to override audit policy category settings** = **Enabled**

### B) Enable Authentication Policy Change (Success)
1. In the same console:  
   **Security Settings → Advanced Audit Policy Configuration → System Audit Policies → Policy Change**  
2. Open **Audit Authentication Policy Change**  
3. Check **Success** (leave Failure unchecked to match the STIG) → **OK**  
4. Run (elevated):  
   ```cmd
   gpupdate /force
   ```

---

## ✅ Verification & Events

- Command:  
  ```cmd
  auditpol /get /subcategory:"Authentication Policy Change"
  ```
  Should show **Success: Enabled**.

- When these policies change, the **Security** log records events such as:  
  - **4713** — Kerberos policy was changed  
  - **4706 / 4707** — A trust to a domain was created / removed

Open **Event Viewer → Windows Logs → Security** and filter by those IDs to confirm activity is audited.

---

## 🧩 Domain / GPO Notes

On domain-joined machines, configure a GPO so settings persist:

```
Computer Configuration
  → Windows Settings
    → Security Settings
      → Advanced Audit Policy Configuration
        → System Audit Policies
          → Policy Change
            → Audit Authentication Policy Change = Success
```
Also ensure this GPO sets **Audit: Force audit policy subcategory settings… = Enabled** under  
**Security Settings → Local Policies → Security Options** (or deploy the registry value).

---

## 📦 Files in this folder

- `Remediation_Scripts/Enable_AuthPolicyChange.ps1` — sets `SCENoApplyLegacyAuditPolicy=1`, enables Success auditing, verifies  
- `Remediation_Scripts/Verify_AuthPolicyChange.ps1` — prints current settings and exits **0** if compliant, **1** otherwise  
- `Intune/Detection.ps1` — returns **1** if remediation is needed  
- `Intune/Remediation.ps1` — applies the fix via Proactive Remediations  
- `Optional_SCENoApplyLegacyAuditPolicy.reg` — REG file to ensure subcategory auditing overrides legacy policy

---

## 🧠 References

- DISA Windows 11 STIG — WN11-AU-000105  
- Microsoft Docs — Advanced Audit Policy: **Authentication Policy Change**  
- Microsoft Security Auditing — Event IDs **4713**, **4706**, **4707**

**Author:** Cybersecurity // Help Desk Projects · Grisham D. (Forward_Advice)  
**License:** MIT
