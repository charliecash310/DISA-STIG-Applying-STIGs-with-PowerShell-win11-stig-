# 🛡️ Windows 11 STIG Remediation — WN11-AC-000025

**Title:** The maximum password age must be configured to 60 days or less.  
**Vulnerability ID:** V-253301  
**Severity:** Medium  
**CCI:** CCI-000199  
**SRG:** SRG-OS-000076-GPOS-00044  
**Updated:** 2025-10-18 16:47:00Z

---

## 📘 Summary
Limiting how long a password can be used reduces the risk of compromise.  
STIG requires **Maximum password age ≤ 60 days**. A value of **0 (never expires)** is **not acceptable**.

---

## 🖱️ GUI Method (Local Security Policy)

1. Press **Win + R**, type `secpol.msc`, and press **Enter**.  
2. Navigate:  
   ```
   Security Settings
     → Account Policies
       → Password Policy
   ```
3. Double‑click **Maximum password age** → set to **60** days (or less).  
4. **OK** → run `gpupdate /force`.

> Domain‑joined devices: set this in a **GPO** at the domain level. Domain policy overrides the local setting.

---

## ⚡ PowerShell Remediation

```powershell
# WN11-AC-000025 — Set Maximum Password Age to 60 days
net accounts /maxpwage:60

# Verify
net accounts | findstr /I "Maximum password age"
```
✅ Expected output contains `60` (and **not** `0`).

---

## 🧩 Verification
```powershell
$result = net accounts | findstr /I "Maximum password age"
$result
```
Confirm value is `60` or less and not `0`.

---

## ✅ Checklist

| Control | Setting | Target | Status |
|----------|----------|---------|---------|
| Maximum password age | 60 days or less (not 0) | ✅ STIG Compliant | ☐ |

---

## 📁 Repository Structure

```
WN11-AC-000025_Max_Password_Age_60days/
├── README.md
├── Remediation_Scripts/
│   ├── Set_MaxPasswordAge60.ps1
│   └── Verify_MaxPasswordAge60.ps1
└── Intune/
    ├── Detection.ps1
    └── Remediation.ps1
```

**Author:** Cybersecurity // Help Desk Projects — Grisham D. (Forward_Advice)  
**License:** MIT
