# Step-by-Step Azure App Service Deployment

## 🎯 Prerequisites
- Azure CLI installed
- Docker installed
- Git installed

## 📋 Step 1: Setup Azure CLI
```bash
# Install Azure CLI (if not installed)
curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash

# Login to Azure
az login

# Set subscription (replace with your subscription ID)
az account set --subscription "your-subscription-id"
```

## 📋 Step 2: Install Ansible
```bash
# Install Python and pip
sudo apt-get update
sudo apt-get install -y python3 python3-pip

# Install Ansible
pip3 install ansible

# Install Azure collections
ansible-galaxy collection install azure.azcollection community.docker
```

## 📋 Step 3: Clone and Setup Project
```bash
# Clone your repository
git clone https://github.com/YOUR_USERNAME/angular-automated-app.git
cd angular-automated-app

# Make sure Docker is running
sudo systemctl start docker
```

## 📋 Step 4: Deploy with Ansible
```bash
# Navigate to ansible directory
cd ansible

# Run the complete deployment
ansible-playbook site.yml
```

## 📋 Step 5: Verify Deployment
```bash
# Check if resources were created
az group show --name angular-automated-app-rg

# Check web app status
az webapp show --name angular-automated-app --resource-group angular-automated-app-rg --query "state"

# Test the application
curl https://angular-automated-app.azurewebsites.net
```

## 🎉 What Gets Created Automatically

1. **Resource Group**: `angular-automated-app-rg`
2. **Container Registry**: `angularautomatedappacr.azurecr.io`
3. **App Service Plan**: `angular-automated-app-plan` (Linux B1)
4. **Web App**: `angular-automated-app.azurewebsites.net`
5. **Docker Image**: Built and pushed automatically
6. **Application**: Deployed and running

## 🔧 Troubleshooting

### If deployment fails:
```bash
# Check Azure resources
az group list --query "[?name=='angular-automated-app-rg']"

# Check web app logs
az webapp log tail --name angular-automated-app --resource-group angular-automated-app-rg

# Restart web app if needed
az webapp restart --name angular-automated-app --resource-group angular-automated-app-rg
```

### If Docker build fails:
```bash
# Build locally first
docker build -t test-build .

# Check if image builds successfully
docker run -p 8080:80 test-build
```

## 🌐 Access Your Application
After successful deployment: **https://angular-automated-app.azurewebsites.net**

## 🔄 Re-deployment
To update your application:
```bash
# Make code changes
# Commit to git
git add .
git commit -m "Update application"

# Re-run Ansible deployment
cd ansible
ansible-playbook site.yml
```

## ⚡ One-Command Deployment
```bash
# Complete setup and deployment in one command
curl -sSL https://raw.githubusercontent.com/YOUR_USERNAME/angular-automated-app/main/setup-deploy.sh | bash
```