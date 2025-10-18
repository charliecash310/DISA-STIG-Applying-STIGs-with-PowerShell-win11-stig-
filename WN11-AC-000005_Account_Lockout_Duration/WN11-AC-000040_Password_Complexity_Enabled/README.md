# 🛡️ Windows 11 STIG Remediation — WN11-AC-000040

**Title:** The built-in Microsoft password complexity filter must be enabled.  
**Vulnerability ID:** V-253304  
**Severity:** Medium  
**CCI:** CCI-004066  
**SRG:** SRG-OS-000069-GPOS-00037  
**Updated:** 2025-10-18 06:27:34Z

---

## 📘 Summary
Complex passwords significantly increase defense against brute-force and dictionary attacks.  
This STIG requires the Windows password policy **"Password must meet complexity requirements"** to be **Enabled**.

---

## 🖱️ GUI Method (Local Security Policy)

1. Press **Win + R**, type `secpol.msc`, and press **Enter**.  
2. Navigate:  
   ```
   Security Settings
     → Account Policies
       → Password Policy
   ```
3. Double-click **Password must meet complexity requirements**.  
4. Set to **Enabled**, then click **Apply → OK**.  
5. Run `gpupdate /force` to apply immediately.

> Note: If your environment uses a custom password filter that requires this to be disabled, document the exception and justification.

---

## ⚡ PowerShell Remediation

```powershell
# WN11-AC-000040 — Enable password complexity
secedit /export /cfg C:\secpol.cfg
(Get-Content C:\secpol.cfg) -replace 'PasswordComplexity = 0', 'PasswordComplexity = 1' | Set-Content C:\secpol.cfg
secedit /configure /db C:\Windows\Security\Database\secedit.sdb /cfg C:\secpol.cfg /areas SECURITYPOLICY
Remove-Item C:\secpol.cfg -Force

# Verify
secedit /export /cfg C:\verify.cfg
Select-String "PasswordComplexity" C:\verify.cfg
Remove-Item C:\verify.cfg -Force
```

✅ Expected Output:
```
PasswordComplexity = 1
```

---

## 🧩 Verification
```powershell
secedit /export /cfg C:\temp_secpol.cfg
Select-String "PasswordComplexity" C:\temp_secpol.cfg
Remove-Item C:\temp_secpol.cfg -Force
```

If the value equals `1`, the setting is **Enabled** and compliant.

---

## ✅ Checklist

| Control | Setting | Target | Status |
|----------|----------|---------|---------|
| Password must meet complexity requirements | Enabled | ✅ STIG Compliant | ☐ |

---

## 📁 Repository Structure

```
WN11-AC-000040_Password_Complexity_Enabled/
├── README.md
├── Remediation_Scripts/
│   ├── Enable_PasswordComplexity.ps1
│   └── Verify_PasswordComplexity.ps1
└── Intune/
    ├── Detection.ps1
    └── Remediation.ps1
```

---

**Author:** Cybersecurity // Help Desk Projects — Grisham D. (Forward_Advice)  
**License:** MIT
