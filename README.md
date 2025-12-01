# Angular 20.3.12 Automated App

Complete automation - **ZERO manual Azure Portal work required!**

## 🚀 Features

- **Angular 20.3.12** - Latest version
- **Docker** - Containerized deployment
- **Ansible** - Complete infrastructure automation
- **GitHub Actions** - CI/CD pipeline
- **Azure App Service** - Cloud deployment
- **Zero Manual Work** - Everything automated

## 📋 Prerequisites

- Azure CLI installed and logged in
- Docker installed
- Node.js 20+ installed

## 🎯 One-Command Deployment

### Option 1: GitHub Actions (Recommended)
1. **Push to GitHub** - Everything deploys automatically
2. **Set GitHub Secret**: `AZURE_CREDENTIALS` (Azure service principal)

### Option 2: Local Ansible
```bash
# Install dependencies
pip install ansible
ansible-galaxy collection install -r ansible/requirements.yml

# Deploy everything
cd ansible
ansible-playbook site.yml
```

## 🏗️ What Gets Created Automatically

1. **Resource Group** - `angular-automated-app-rg`
2. **Container Registry** - `angularautomatedappacr`
3. **App Service Plan** - `angular-automated-app-plan`
4. **Web App** - `angular-automated-app`
5. **Docker Image** - Built and pushed automatically
6. **Application** - Deployed and started

## 🌐 Access Your App

After deployment: https://angular-automated-app.azurewebsites.net

## 🔧 Local Development

```bash
npm install
npm start
```

## 🐳 Docker Build

```bash
docker build -t angular-automated-app .
docker run -p 8080:80 angular-automated-app
```

## 🎉 That's It!

Commit your code → Everything deploys automatically!

No Azure Portal. No manual steps. Pure automation.