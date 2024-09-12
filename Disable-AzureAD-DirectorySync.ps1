# Install the Microsoft Graph PowerShell Module
# This ensures you have the latest tools to interact with Azure AD (Microsoft Entra ID)
Install-Module Microsoft.Graph -Scope CurrentUser -Force

# Connect to Microsoft Graph with necessary permissions to manage directory sync
# You will be prompted to log in with tenant admin credentials
Connect-MgGraph -Scopes Organization.ReadWrite.All

# Retrieve the organization ID from your tenant
$OrgID = (Get-MgOrganization).Id

# Disable directory synchronization, effectively making all users cloud-only
# No user data such as email aliases or UPNs will be affected
$params = @{
    OnPremisesSyncEnabled = $false
}

# Apply the update to disable directory sync for your organization
Update-MgOrganization -OrganizationId $OrgID -BodyParameter $params

# Output success message (optional)
Write-Host "Directory synchronization has been successfully disabled. Users are now cloud-only."

# Disconnect from Microsoft Graph to end the session
Disconnect-MgGraph
