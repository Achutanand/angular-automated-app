# Install Azure CLI

## Windows (Git Bash/PowerShell)

### Option 1: Download Installer
1. Go to https://aka.ms/installazurecliwindows
2. Download and run the MSI installer
3. Restart Git Bash/PowerShell

### Option 2: PowerShell (Run as Administrator)
```powershell
Invoke-WebRequest -Uri https://aka.ms/installazurecliwindows -OutFile .\AzureCLI.msi
Start-Process msiexec.exe -Wait -ArgumentList '/I AzureCLI.msi /quiet'
```

### Option 3: Chocolatey
```powershell
choco install azure-cli
```

### Option 4: Winget
```powershell
winget install Microsoft.AzureCLI
```

## Linux/macOS

### Ubuntu/Debian
```bash
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
```

### macOS
```bash
brew install azure-cli
```

## Verify Installation
```bash
az --version
```

## After Installation - Continue Deployment
```bash
# Login to Azure
az login

# Create service principal
az ad sp create-for-rbac --name "angular-automated-app-sp" --role contributor --scopes /subscriptions/YOUR_SUBSCRIPTION_ID --sdk-auth
```

## Alternative: Use Cloud Shell
If you can't install Azure CLI locally:
1. Go to https://shell.azure.com
2. Run the commands in Azure Cloud Shell
3. Copy the service principal JSON output