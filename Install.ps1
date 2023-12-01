[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.SecurityProtocolType]::Tls12
Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted

$Parameters = @{
    Confirm      = $false 
    Force        = $true
    Scope        = "CurrentUser"
    AllowClobber = $true
    Repository   = "PSGallery"
}

# Microsoft
Install-Module @Parameters -Name 'Microsoft.PowerShell.SecretManagement'
Install-Module @Parameters -Name 'Microsoft.PowerShell.SecretStore'
Install-Module @Parameters -Name 'Microsoft.Graph'

# Microsoft Online
Install-Module @Parameters -Name 'MSOnline'
Install-Module @Parameters -Name 'AzureAD'
Install-Module @Parameters -Name 'ExchangeOnlineManagement'
Install-Module @Parameters -Name 'Microsoft.Online.SharePoint.PowerShell'
Install-Module @Parameters -Name 'MicrosoftTeams'

Install-Module @Parameters -Name 'MSAL.PS'