# 🛡️ Windows 11 STIG Remediation — WN11-AC-000035

**Title:** Passwords must, at a minimum, be 14 characters.  
**Vulnerability ID:** V-253303  
**Severity:** Medium  
**CCI:** CCI-000205  
**SRG:** SRG-OS-000078-GPOS-00046  
**Updated:** 2025-10-18 06:52:43Z

---

## 📘 Summary
Short passwords make systems vulnerable to brute-force attacks. This STIG enforces a minimum password length of **14 characters** for all local accounts.

---

## 🖱️ GUI Method (Local Group Policy)

1. Press **Win + R**, type `gpedit.msc`, and press **Enter**.  
2. Navigate:  
   ```
   Computer Configuration
     → Windows Settings
       → Security Settings
         → Account Policies
           → Password Policy
   ```
3. Double-click **Minimum password length**.  
4. Set to **14** characters → Click **Apply** → **OK**.  
5. Run `gpupdate /force` to apply the changes immediately.

---

## ⚡ PowerShell Remediation

```powershell
# WN11-AC-000035 — Set minimum password length to 14 characters
net accounts /minpwlen:14

# Verify
net accounts | findstr /I "Minimum"
```

✅ **Expected Output:**
```
Minimum password length (characters): 14
```

---

## 🧩 Verification

```powershell
net accounts | findstr /I "Minimum"
```
If the value displayed is **14**, the system is compliant.

---

## ✅ Checklist

| Control | Setting | Target | Status |
|----------|----------|---------|---------|
| Minimum password length | 14 characters | ✅ STIG Compliant | ☐ |

---

## 📁 Repository Structure

```
WN11-AC-000035_Minimum_Password_Length_14/
├── README.md
├── Remediation_Scripts/
│   ├── Set_MinPassword14.ps1
│   └── Verify_MinPassword14.ps1
└── Intune/
    ├── Detection.ps1
    └── Remediation.ps1
```

---

**Author:** Cybersecurity // Help Desk Projects — Grisham D. (Forward_Advice)  
**License:** MIT
