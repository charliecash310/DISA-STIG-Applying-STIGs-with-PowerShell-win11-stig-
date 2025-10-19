# 🛡️ Windows 11 STIG Remediation — WN11-AC-000030

**Title:** The minimum password age must be configured to at least 1 day.  
**Vulnerability ID:** V-253302  
**Severity:** Medium  
**CCI:** CCI-004066, CCI-000198, CCI-000198  
**SRG:** SRG-OS-000075-GPOS-00043  
**Updated:** 2025-10-18 04:06:36Z

---

## 📘 Summary
If users can change a password multiple times on the same day, they can cycle through history and defeat password reuse rules.  
STIG requires **Minimum password age ≥ 1 day**.

---

## 🖱️ GUI Method (Local Security Policy)

1. Press **Win + R**, type `secpol.msc`, and press **Enter**.  
2. Navigate:  
   ```
   Security Settings
     → Account Policies
       → Password Policy
   ```
3. Double‑click **Minimum password age** → set to **1 day** (or higher).  
4. **OK** → run `gpupdate /force`.

---

## ⚡ PowerShell Remediation

```powershell
# Set Minimum Password Age to 1 day
net accounts /minpwage:1

# Verify
net accounts | findstr /I "Minimum password age Maximum password age"
```
Expected snippet:
```
Minimum password age (days):       1
```

> Note: If the machine is domain‑joined, these settings should be configured via **GPO** at the domain level and will override local values.

---

## ✅ Verification
```powershell
(net accounts) -join "`n"
```
Ensure **Minimum password age** is `1` or more.

---

## 📦 Files in this folder
- `Remediation_Scripts\Set_MinPasswordAge.ps1` — applies `/minpwage:1` and echoes results  
- `Remediation_Scripts\Verify_MinPasswordAge.ps1` — exits 0 if compliant, 1 otherwise  
- `Intune\Detection.ps1` — returns 1 when remediation is needed  
- `Intune\Remediation.ps1` — applies the fix for Proactive Remediations

**Author:** Cybersecurity // Help Desk Projects · Grisham D. (Forward_Advice)  
**License:** MIT
