#!/bin/bash

echo "🚀 Angular 20.3.12 Automated Deployment Starting..."

# Check if running on Linux/macOS
if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "cygwin" ]]; then
    echo "❌ This script is for Linux/macOS. Use WSL on Windows."
    exit 1
fi

# Install Python and pip
echo "📦 Installing Python and pip..."
if command -v apt-get &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y python3 python3-pip curl
elif command -v yum &> /dev/null; then
    sudo yum install -y python3 python3-pip curl
elif command -v brew &> /dev/null; then
    brew install python3
fi

# Install Ansible
echo "📦 Installing Ansible..."
pip3 install ansible

# Install Azure collections
echo "📦 Installing Azure collections..."
ansible-galaxy collection install azure.azcollection community.docker

# Check if Azure CLI is installed
if ! command -v az &> /dev/null; then
    echo "📦 Installing Azure CLI..."
    curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
fi

# Login to Azure
echo "🔐 Logging into Azure..."
if ! az account show &> /dev/null; then
    az login
fi

# Install Docker if not present
if ! command -v docker &> /dev/null; then
    echo "📦 Installing Docker..."
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    echo "⚠️  Please logout and login again for Docker permissions, then re-run this script"
    exit 1
fi

# Start Docker service
sudo systemctl start docker 2>/dev/null || true

# Deploy with Ansible
echo "🏗️ Deploying infrastructure and application..."
cd ansible
ansible-playbook site.yml

echo ""
echo "✅ Deployment completed successfully!"
echo "🌐 Your Angular app is available at:"
echo "   https://angular-automated-app.azurewebsites.net"
echo ""
echo "🔍 To check status:"
echo "   az webapp show --name angular-automated-app --resource-group angular-automated-app-rg --query 'state'"