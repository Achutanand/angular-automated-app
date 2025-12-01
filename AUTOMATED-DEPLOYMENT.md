# Automated Deployment via GitHub Actions

## 🎯 Zero Manual Process - Complete Automation

### Step 1: Create Azure Service Principal
```bash
# Login to Azure
az login

# Create service principal (replace YOUR_SUBSCRIPTION_ID)
az ad sp create-for-rbac --name "angular-automated-app-sp" \
  --role contributor \
  --scopes /subscriptions/YOUR_SUBSCRIPTION_ID \
  --sdk-auth
```

**Copy the JSON output** - you'll need it for GitHub secrets.

### Step 2: Create GitHub Repository
1. Go to https://github.com/new
2. Repository name: `angular-automated-app`
3. Make it **Public** or **Private**
4. **Don't** initialize with README
5. Click **Create repository**

### Step 3: Add GitHub Secret
1. Go to your repository → **Settings** → **Secrets and variables** → **Actions**
2. Click **New repository secret**
3. Name: `AZURE_CREDENTIALS`
4. Value: **Paste the JSON from Step 1**
5. Click **Add secret**

### Step 4: Push Code to GitHub
```bash
cd angular-automated-app

# Initialize git
git init

# Add all files
git add .

# Commit
git commit -m "Initial commit: Angular 20.3.12 automated app"

# Add remote (replace YOUR_USERNAME)
git remote add origin https://github.com/YOUR_USERNAME/angular-automated-app.git

# Push to main branch
git branch -M main
git push -u origin main
```

## 🚀 That's It! Automatic Deployment Starts

### What Happens Automatically:
1. ✅ **GitHub Actions triggers** on push to main
2. ✅ **Ansible installs** automatically
3. ✅ **Azure resources created**:
   - Resource Group: `angular-automated-app-rg`
   - Container Registry: `angularautomatedappacr`
   - App Service Plan: `angular-automated-app-plan`
   - Web App: `angular-automated-app`
4. ✅ **Docker image built** and pushed
5. ✅ **Application deployed** to Azure
6. ✅ **App started** automatically

### Monitor Deployment:
- Go to your GitHub repository
- Click **Actions** tab
- Watch the deployment progress
- Deployment takes ~5-10 minutes

### Access Your App:
**https://angular-automated-app.azurewebsites.net**

## 🔄 Future Updates

**Just push code** - everything redeploys automatically:
```bash
# Make changes to your code
git add .
git commit -m "Update application"
git push
```

## 🎉 Result

**Zero manual Azure Portal work!**
**Zero manual deployment steps!**
**Just push code → App deploys automatically!**