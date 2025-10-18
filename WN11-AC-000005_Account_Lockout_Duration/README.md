# 🛡️ Windows 11 STIG Remediation — WN11-AC-000005

**Title:** Windows 11 account lockout duration must be configured to 15 minutes or greater.  
**Vulnerability ID:** V-253297  
**Severity:** Medium  
**CCI:** CCI-002238  
**SRG:** SRG-OS-000329-GPOS-00128  
**Updated:** 2025-10-18 04:50:15Z

---

## 📘 Summary
The **Account Lockout Duration** defines how long an account remains inaccessible after repeated failed logons.  
STIG requires this value to be **15 minutes or greater**.  
A value of **0** is acceptable if it requires an administrator to unlock the account.

---

## 🖱️ GUI Method (Local Group Policy)

1. Press **Win + R**, type `gpedit.msc`, and press **Enter**.  
2. Navigate:  
   ```
   Computer Configuration
     → Windows Settings
       → Security Settings
         → Account Policies
           → Account Lockout Policy
   ```
3. Double-click **Account lockout duration**.  
4. Set to **15 minutes or greater**, or **0** to require admin unlock.  
5. Click **Apply → OK**, then run `gpupdate /force`.

---

## ⚡ PowerShell Remediation

```powershell
# WN11-AC-000005 — Set Account Lockout Duration to 15 minutes
net accounts /lockoutduration:15

# Verify configuration
net accounts | findstr "Lockout"
```
✅ Expected output:
```
Lockout duration (minutes):         15
```

---

## 🧩 Verification

```powershell
(net accounts | findstr /I "Lockout") -join "`n"
```
Ensure **Lockout duration** is `15` or greater.

---

## ✅ Checklist

| Control | Setting | Target | Status |
|----------|----------|---------|---------|
| Account lockout duration | 15 minutes or greater | ✅ STIG Compliant | ☐ |

---

## 📁 Repository Structure

```
WN11-AC-000005_Account_Lockout_Duration/
├── README.md
├── Remediation_Scripts/
│   ├── Set_AccountLockoutDuration.ps1
│   └── Verify_AccountLockoutDuration.ps1
└── Intune/
    ├── Detection.ps1
    └── Remediation.ps1
```

---

**Author:** Cybersecurity // Help Desk Projects — Grisham D. (Forward_Advice)  
**License:** MIT
