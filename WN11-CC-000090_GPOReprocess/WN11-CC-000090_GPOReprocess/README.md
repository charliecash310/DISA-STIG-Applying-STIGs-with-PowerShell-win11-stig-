# 🛡️ Windows 11 STIG Remediation: Group Policy objects must be reprocessed even if they have not changed

**STIG ID:** WN11-CC-000090  
**Vuln ID:** V-253373  
**Severity:** Medium  
**CCI:** CCI-000366  
**SRG:** SRG-OS-000480-GPOS-00227  
**Updated:** 2025-10-07 04:29:35Z

This hardening ensures **registry policy processing** re-applies at every background refresh **even if no GPO changes are detected**. It helps recover from unauthorized local changes and drift.

---

## 🔍 What the scanner checks

Registry value exists and is set as follows:

| Hive | Path | Value | Type | Expected |
|------|------|-------|------|----------|
| `HKLM` | `SOFTWARE\Policies\Microsoft\Windows\Group Policy\{{35378EAC-683F-11D2-A89A-00C04FBBCFA2}}` | `NoGPOListChanges` | `REG_DWORD` | `0` |

> `0` = **Process even if the GPOs have not changed** (compliant)  
> `1` or missing = non-compliant

---

## ⚡ PowerShell Remediation (Run as Administrator)

```powershell
# STIG: WN11-CC-000090 — Force registry policy reprocessing every refresh
$path = 'HKLM:\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}'
$name = 'NoGPOListChanges'

# Create policy key and set value = 0 (process even if unchanged)
New-Item -Path $path -Force | Out-Null
New-ItemProperty -Path $path -Name $name -PropertyType DWord -Value 0 -Force | Out-Null

# Optional: immediate application
gpupdate /force

# Verify
(Get-ItemProperty -Path $path -Name $name).$name
```

Expected verification output: `0`

---

## 🖱️ GUI Method (Local Group Policy Editor)

1. Press **Win+R** → `gpedit.msc`  
2. Navigate:  
   `Computer Configuration → Administrative Templates → System → Group Policy`  
3. Open **Configure registry policy processing** → set to **Enabled**  
4. Check **Process even if the Group Policy objects have not changed** → **OK**  
5. In an elevated Command Prompt, run: `gpupdate /force`

---

## ✅ Verification

- **Registry**:  
  ```cmd
  reg query "HKLM\SOFTWARE\Policies\Microsoft\Windows\Group Policy\{35378EAC-683F-11D2-A89A-00C04FBBCFA2}" /v NoGPOListChanges
  ```
  Should show `0x0`.

- **Policy report**:  
  ```cmd
  gpresult /h C:\gp.html
  ```
  Open `C:\gp.html` and confirm **Configure registry policy processing** is Enabled and **Process even if…** is applied.

---

## 📦 Files in this folder

- `Remediation_Scripts\Enable_GPO_Reprocess.ps1` — sets the registry policy and verifies
- `Remediation_Scripts\Verify_GPO_Reprocess.ps1` — prints the value and exits 0/1
- `Intune\Detection.ps1` — returns 1 if remediation needed
- `Intune\Remediation.ps1` — applies the fix at scale
- `Enable_GPO_Reprocess.reg` — double‑click .reg to enforce without PowerShell

---

## 🧠 Notes

- If your device is **domain-joined**, configure the same under GPO so it persists:  
  `Computer Configuration → Administrative Templates → System → Group Policy → Configure registry policy processing = Enabled` and check **Process even if the Group Policy objects have not changed**.
- This setting increases background processing load slightly; it’s generally negligible for single systems.

**Author:** Cybersecurity // Help Desk Projects · Grisham D. (Forward_Advice)  
**License:** MIT
