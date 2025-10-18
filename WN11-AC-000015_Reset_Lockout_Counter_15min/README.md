# 🛡️ Windows 11 STIG Remediation — WN11-AC-000015

**Title:** The period of time before the bad logon counter is reset must be configured to 15 minutes.  
**Vulnerability ID:** V-253299  
**Severity:** Medium  
**CCI:** CCI-000044  
**SRG:** SRG-OS-000021-GPOS-00005  
**Updated:** 2025-10-18 06:45:33Z

---

## 📘 Summary
This setting controls how long Windows waits before resetting the failed logon attempt counter.  
To prevent brute-force attacks, the counter must reset only after **15 minutes** or more.

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
3. Double-click **Reset account lockout counter after**.  
4. Set to **15 minutes** → Click **Apply** → **OK**.  
5. Run `gpupdate /force` to apply immediately.

---

## ⚡ PowerShell Remediation

```powershell
# WN11-AC-000015 — Reset account lockout counter to 15 minutes
net accounts /lockoutwindow:15

# Verify
net accounts | findstr /I "Lockout"
```

✅ **Expected Output:**
```
Lockout observation window (minutes): 15
```

---

## 🧩 Verification

```powershell
net accounts | findstr /I "Lockout"
```
If the output shows **15**, the system is compliant.

---

## ✅ Checklist

| Control | Setting | Target | Status |
|----------|----------|---------|---------|
| Reset account lockout counter after | 15 minutes | ✅ STIG Compliant | ☐ |

---

## 📁 Repository Structure

```
WN11-AC-000015_Reset_Lockout_Counter_15min/
├── README.md
├── Remediation_Scripts/
│   ├── Set_LockoutCounter15.ps1
│   └── Verify_LockoutCounter15.ps1
└── Intune/
    ├── Detection.ps1
    └── Remediation.ps1
```

---

**Author:** Cybersecurity // Help Desk Projects — Grisham D. (Forward_Advice)  
**License:** MIT
