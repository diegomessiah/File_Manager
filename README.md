# File Manager Scripts (PowerShell)

A collection of useful PowerShell scripts designed to assist system administrators with common file system and user management tasks.

## 📂 Features

- Calculate folder sizes for shared directories
- List local administrators on machines
- Export results to CSV
- Check file system usage
- Automated reporting

## ⚙️ Requirements

- Windows PowerShell 5.1+
- Execution Policy set to allow script execution

## 🚀 Usage

Each script is standalone. Example:

```powershell
.\Get-FolderSize.ps1 -Path "C:\\Shared"
```
Make sure to run PowerShell with administrative privileges when needed.

## 📁 Scripts
- Get-FolderSize.ps1 - Calculates folder size in GB
- Get-LocalAdmins.ps1 - Lists members of the local Administrators group
- Machine_Name.ps1 - Retrieves machine hostname and domain/workgroup details
- Permission_Folder.ps1 - Checks and lists folder permissions, including users/groups and access types
- 
## 📄 License
This project is licensed under the MIT License.

## 🙋‍♂️ Author
Diego Messiah
