# NullToolkit ⚡

A high-performance PowerShell toolkit for modern environments. Designed for developers and power users who need quick system maintenance, optimization, and environment validation.

![Version](https://img.shields.io/badge/version-1.0.0-blue.svg)
![Powershell](https://img.shields.io/badge/PowerShell-5.1%2B-blue.svg)

---

### Features 🚀

- **System Cleaner**: Deep-cleans temporary files, prefetch logs, and resets Windows Event Logs to remove traces.
- **Gaming Optimizer**: Instantly enforces High Performance power plans and disables background services like GameBar.
- **Environment Check**: Validates Secure Boot status and standard AV status to ensure a clean driver loading environment.
- **ID Manifest**: Quickly pulls Disk, BIOS, and CPU serials for hardware verification/spoofing checks.

### Quick Start 🛠️

1. **Clone the repository**:
   ```bash
   git clone https://github.com/nullptrflow/NullToolkit.git
   cd NullToolkit
   ```

2. **Run the script**:
   *Make sure you run PowerShell as **Administrator**.*
   ```powershell
   ./NullToolkit.ps1
   ```

### Modular Design 📦

- `modules/Cleaner.psm1` - System trace and log cleanup.
- `modules/Optimizer.psm1` - Power and performance profiles.
- `modules/Utils.psm1` - Hardware IDs and environment state.

---

### FAQ ❓

**Q: Do I need administrator rights?**  
A: Yes. Many functions require direct access to Windows System APIs to clear logs or change power plans.

**Q: What is the purpose of the cleaner?**  
A: To clear traces of activity and reduce disk bloat from temporary caches and event logs.

**Q: Is this safe?**  
A: Standard Windows commands are used throughout. No external binaries are required.

---
Created by [nullptrflow](https://github.com/nullptrflow)
