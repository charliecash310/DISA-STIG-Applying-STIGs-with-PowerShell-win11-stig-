# 🛡️ Windows 11 STIG Remediation: Remote host allows delegation of non-exportable credentials

**STIG ID:** WN11-CC-000068  
**Vuln ID:** V-253368  
**Severity:** Medium  
**CCI:** CCI-000366  
**SRG:** SRG-OS-000480-GPOS-00227  
**Updated:** 2025-10-17 05:56:08Z

Enables delegation of **non-exportable credentials** (Restricted Admin / Remote Credential Guard) to protect against credential theft over RDP and other delegation scenarios.

---

## 🔍 What the scanner checks

| Hive | Path | Name | Type | Expected |
|------|------|------|------|----------|
| `HKLM` | `SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation` | `AllowProtectedCreds` | `REG_DWORD` | `1` |

`1` = Enabled (compliant). Missing or `0` = finding.

---

## ⚡ PowerShell Remediation (Run as Administrator)

```powershell
# WN11-CC-000068 — Enable Remote host allows delegation of non-exportable credentials
$Path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation'
$Name = 'AllowProtectedCreds'

New-Item -Path $Path -Force | Out-Null
New-ItemProperty -Path $Path -Name $Name -PropertyType DWord -Value 1 -Force | Out-Null

# Optional: apply immediately
gpupdate /force

# Verify
(Get-ItemProperty -Path $Path -Name $Name).$Name   # should output 1
```

---

## 🖱️ GUI Method (Local Group Policy)

1. **Win+R →** `gpedit.msc`  
2. Navigate:  
   `Computer Configuration → Administrative Templates → System → Credentials Delegation`
3. Open **Remote host allows delegation of non-exportable credentials** → set to **Enabled** → **OK**
4. Run `gpupdate /force`

---

## ✅ Verification

- **Registry:**  
  ```cmd
  reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\CredentialsDelegation" /v AllowProtectedCreds
  ```
  Expected: `0x1`

- **Policy report:**  
  ```cmd
  gpresult /h C:\gp.html
  ```
  Confirm **Remote host allows delegation of non-exportable credentials = Enabled**.

---

## 📦 Files in this folder

- `Remediation_Scripts\Enable_AllowProtectedCreds.ps1` — sets registry and verifies  
- `Remediation_Scripts\Verify_AllowProtectedCreds.ps1` — exits 0 if compliant, 1 if not  
- `Intune\Detection.ps1` — returns 1 when remediation is needed  
- `Intune\Remediation.ps1` — applies the setting via Proactive Remediations  
- `Enable_AllowProtectedCreds.reg` — double‑click to enforce without PowerShell

**Author:** Cybersecurity // Help Desk Projects · Grisham D. (Forward_Advice)  
**License:** MIT
