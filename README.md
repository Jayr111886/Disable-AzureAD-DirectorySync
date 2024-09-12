# Disable Azure Active Directory Directory Synchronization

This repository provides a PowerShell script that disables directory synchronization between on-premises Active Directory and Azure Active Directory (Microsoft Entra ID) using Microsoft Graph PowerShell. This script converts users to **cloud-only** accounts without affecting email aliases, UPNs, or other user data.

## Features
- **Disable Directory Sync**: Converts users to cloud-only while keeping all user data intact (e.g., email aliases, UPNs, passwords).
- **No Data Loss**: Ensures that users retain access to all data, accounts, and services after directory sync is disabled.
- **Microsoft Graph API**: Uses Microsoft Graph PowerShell for managing Azure AD, ensuring modern and future-proof management.

## Prerequisites
1. PowerShell 5.1 or later.
2. Microsoft Graph PowerShell module installed.
3. Administrator permissions on the Azure AD tenant.

## Installation

1. Clone the repository or download the script:
    ```bash
    git clone https://github.com/RubenAQuispe/Disable-AzureAD-DirectorySync.git
    ```

2. Install the Microsoft Graph PowerShell module (if not already installed):
    ```powershell
    Install-Module Microsoft.Graph -Scope CurrentUser -Force
    ```

3. Run the script to disable directory synchronization.

## Usage

To disable directory synchronization in your Microsoft 365 tenant, follow these steps:

1. Open PowerShell and ensure you're running it as an administrator.
2. Run the script:

    ```powershell
    ./Disable-AzureAD-DirectorySync.ps1
    ```

3. You will be prompted to authenticate with your tenant admin credentials.

4. After executing, the script will disable directory synchronization, converting all synchronized users to **cloud-only** users.

### **Expected Behavior**:
- Users will switch from hybrid (on-prem + Azure AD) to cloud-only management.
- No user data, email aliases, or UPNs will be lost or altered during this process.
- The process may take up to **72 hours** to fully propagate in your tenant.

## Script Breakdown

1. **Module Installation**: Ensures the Microsoft Graph PowerShell module is installed.
2. **Tenant Login**: Authenticates with Microsoft 365 tenant using `Connect-MgGraph`.
3. **Organization ID Retrieval**: Fetches the unique identifier of your tenant.
4. **Directory Sync Disablement**: Disables directory synchronization via Microsoft Graph.
5. **Success Confirmation**: Notifies the user when directory sync is successfully disabled.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
