# 🛡️ Windows 11 DISA STIG Remediation Repository  
# DISA-STIG-Applying-STIGs-with-PowerShell-WIN11-STIG
**Automated Compliance Hardening using PowerShell & Intune**

---

## 📖 Overview
This repository provides **PowerShell-based remediation scripts**, **Intune detection/remediation modules**, and **documentation** for aligning **Windows 11 systems** with the **Defense Information Systems Agency (DISA) Security Technical Implementation Guides (STIGs)**.

The goal is to help system administrators, cybersecurity analysts, and compliance engineers apply **Windows 11 STIG controls** efficiently using PowerShell automation and Group Policy (GUI) references.

Each control includes:
- STIG ID, SRG reference, CCI, severity  
- GUI method (Local Group Policy)  
- PowerShell remediation  
- Verification script  
- Intune detection/remediation  
- Compliance checklist

---

## 🧩 Repository Structure
```

Each STIG folder includes:
```
├── README.md
├── Remediation_Scripts/
│   ├── <Remediation>.ps1
│   └── <Verification>.ps1
└── Intune/
    ├── Detection.ps1
    └── Remediation.ps1
```

---

## ⚙️ Usage

### 🖥️ PowerShell Method
Run locally or deploy via Intune/SCCM/GPO:

```powershell
# Example
.\Remediation_Scripts\Set_MaxPasswordAge60.ps1
```

Verification:
```powershell
.\Remediation_Scripts\Verify_MaxPasswordAge60.ps1
```

Expected output:
```
Compliant — Maximum password age is 60 days.
```

---

### 🧠 Intune Deployment
Use Intune for automated compliance enforcement.

- **Detection.ps1**: Returns compliance (exit 0 = compliant)
- **Remediation.ps1**: Enforces STIG settings

Steps:
1. Go to **Devices → Scripts → Add**.  
2. Upload Detection + Remediation scripts.  
3. Assign to target groups.

---

## 🔐 Security Considerations
- Always run scripts as **Administrator**.  
- Test before production deployment.  
- Use **Intune/GPO/SCCM** for large rollouts.  
- Document exceptions for specific systems.

---

## 📚 References
- [DISA STIG Library](https://public.cyber.mil/stigs/)  
- [Microsoft Security Baselines for Windows 11](https://learn.microsoft.com/en-us/windows/security/threat-protection/windows-security-baselines)  
- [PowerShell Security Best Practices](https://learn.microsoft.com/en-us/powershell/scripting/learn/ps101/00-introduction)

---

## 👨‍💻 Author
**Grisham D.** — *Forward_Advice*  
Cybersecurity & IT Professional  
Part of the *Cybersecurity // Help Desk Projects* initiative  

---

## 🧾 License
Licensed under **MIT License**. Use freely for training and enterprise hardening.

---

🕓 Last Updated: 2025-10-19 07:36:14Z

