# 🛡️ Windows 11 STIG Remediation — WN11-AC-000020

**Title:** The password history must be configured to 24 passwords remembered.  
**Vulnerability ID:** V-253300  
**Severity:** Medium  
**CCI:** CCI-004061  
**SRG:** SRG-OS-000077-GPOS-00045  
**Updated:** 2025-10-18 05:25:53Z

---

## 📘 Summary
To prevent users from reusing recent passwords and defeating rotation policy, Windows must **remember at least 24 previous passwords**. This is enforced with **Enforce password history**.

---

## 🖱️ GUI Method (Local Security Policy)

1. Press **Win + R**, type `secpol.msc`, and press **Enter**.  
2. Navigate:  
   ```
   Security Settings
     → Account Policies
       → Password Policy
   ```
3. Double‑click **Enforce password history** → set to **24 passwords remembered**.  
4. **OK** → run `gpupdate /force`.

> Domain‑joined devices: set this in a **GPO** at the domain level. Domain policy overrides the local setting.

---

## ⚡ PowerShell Remediation

```powershell
# WN11-AC-000020 — Enforce password history of 24
net accounts /uniquepw:24

# Verify
net accounts | findstr /I "history unique"
```
Expected snippet:
```
Password history length:           24
```

---

## ✅ Verification
```powershell
# Show entire policy for quick audit
net accounts
```

---

## ✅ Checklist

| Control | Setting | Target | Status |
|----------|----------|---------|---------|
| Enforce password history | 24 passwords remembered | ✅ STIG Compliant | ☐ |

---

## 📁 Repository Structure

```
WN11-AC-000020_Password_History_24/
├── README.md
├── Remediation_Scripts/
│   ├── Set_PasswordHistory24.ps1
│   └── Verify_PasswordHistory24.ps1
└── Intune/
    ├── Detection.ps1
    └── Remediation.ps1
```

**Author:** Cybersecurity // Help Desk Projects — Grisham D. (Forward_Advice)  
**License:** MIT
