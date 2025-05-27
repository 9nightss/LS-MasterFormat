# LS-MasterFormat Tool

**Format & Encrypt USB Drives Across Windows, Linux, and macOS**

---

## Overview

LS-MasterFormat is part of series of server tools called "LS project"
LS-MasterFormat is a cross-platform GUI application built with CustomTkinter that allows users to safely format and encrypt removable USB drives. The tool supports multiple file systems and encryption methods, including BitLocker (Windows), LUKS (Linux), and FileVault (macOS).

Designed for power users, system admins, and anyone needing quick, automated USB drive preparation with encryption.

---

## Features

* Detects removable drives automatically.
* Formats USB drives with NTFS, exFAT, FAT32, or ext4.
* Encrypts drives using:

  * BitLocker (Windows)
  * LUKS (Linux)
  * FileVault (macOS)
* GUI built with modern CustomTkinter for an intuitive user experience.
* Logs encryption events with timestamps.
* Supports single or batch (all detected drives) processing.
* Safety confirmation dialogs to prevent accidental data loss.

---

## Installation

### Prerequisites

* Python 3.9+
* Required Python packages:

  * `customtkinter`
  * `psutil`

### Install dependencies

```bash
pip install customtkinter psutil
```

### Additional Requirements by OS

* **Windows**: `manage-bde` available (built into Windows Pro/Enterprise editions).
* **Linux**: `cryptsetup` installed with root privileges.
* **macOS**: Uses `fdesetup` — run with appropriate permissions.

---

## Usage

1. Run the Python script:

```bash
python LS-MasterFormat.py
```

2. Use the GUI to:

   * Select a drive or all drives.
   * Choose your operating system.
   * Pick the desired file system.
   * Select an encryption method.
   * Click **Format + Encrypt** to start.

3. Monitor progress and status messages in the output window.

---

## Important Notes

* **This tool will erase data on the selected drives!** Make sure you back up any important data before proceeding.
* Running the tool may require administrator/root privileges.
* FileVault encryption for external drives on macOS may require additional configuration; currently, it enables system disk encryption.
* Use "All Drives" option cautiously to avoid formatting critical drives.
* Tested on Windows 10/11, Ubuntu Linux, and macOS Monterey.

---

## Troubleshooting

* If formatting fails on Windows, check drive readiness and admin privileges.
* On Linux, ensure `cryptsetup` is installed and you have sudo rights.
* On macOS, ensure you run with the right permissions and understand FileVault limitations.

---

## Contributing

Feel free to open issues or pull requests. This tool is a work in progress, and your feedback or improvements are welcome!

---

## Contact

Fatih ULUSOY
Email: [afatihu@icloud.com](mailto:afatihu@icloud.com)

---

## License

MIT License

---

---

Would you like me to help you with a more detailed contribution guide or automate the install with a `requirements.txt`? Or maybe prepare a quick start tutorial GIF/video? Let me know!
