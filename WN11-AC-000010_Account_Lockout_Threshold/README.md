# 🛡️ Windows 11 STIG Remediation — WN11-AC-000010

**Title:** The number of allowed bad logon attempts must be configured to three or less.  
**Vulnerability ID:** V-253298  
**Severity:** Medium  
**CCI:** CCI-000044  
**SRG:** SRG-OS-000021-GPOS-00005  

---

## 📘 Vulnerability Summary
The Account Lockout Threshold prevents brute-force password guessing.  
DISA STIG requires this to be set to **3 or fewer invalid logon attempts**.

---

## 🖱️ GUI Method (Local Group Policy)
1. Press **Win + R**, type `gpedit.msc`, and press **Enter**.  
2. Navigate to:  
   ```
   Computer Configuration
     → Windows Settings
       → Security Settings
         → Account Policies
           → Account Lockout Policy
   ```
3. Double-click **Account lockout threshold**.  
4. Set it to **3 invalid logon attempts**.  
5. Click **Apply → OK**, then run `gpupdate /force`.

---

## ⚡ PowerShell Remediation

```powershell
# Set Account Lockout Threshold to 3
net accounts /lockoutthreshold:3

# Verify
net accounts | findstr "Lockout"
```

Expected output:
```
Lockout threshold:                  3 invalid logon attempts
Lockout duration (minutes):         15
Lockout observation window (minutes):15
```

---

## 🧩 Verification

```powershell
net accounts
```
Look for:
`Lockout threshold: 3`

---

## ✅ Checklist

| Control | Setting | Target | Status |
|----------|----------|---------|---------|
| Account lockout threshold | 3 invalid logon attempts | ✅ STIG Compliant | ☐ |

---

## 📁 Repository Structure

```
WN11-AC-000010_Account_Lockout_Threshold/
├── README.md
├── Remediation_Scripts/
│   ├── Set_AccountLockoutThreshold.ps1
│   └── Verify_AccountLockoutThreshold.ps1
└── Intune/
    ├── Detection.ps1
    └── Remediation.ps1
```

---

**Author:** Cybersecurity // Help Desk Projects — Grisham D. (Forward_Advice)  
**License:** MIT
