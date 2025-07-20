# Deployment Options for Your Portfolio Website

## 🚀 Option 1: ngrok (Instant Public URL - Great for Testing)

**Perfect for: Immediate sharing, testing, demos**

### Steps:
1. **Download ngrok**: https://ngrok.com/download
2. **Sign up** for a free account at https://ngrok.com
3. **Install and authenticate**:
   ```bash
   ngrok config add-authtoken YOUR_TOKEN
   ```
4. **Start your website** (if not already running):
   ```bash
   cd MyWebsite
   dotnet run
   ```
5. **In a new terminal, expose your local server**:
   ```bash
   ngrok http 5067
   ```
6. **Share the URL**: ngrok will provide a public URL like `https://abc123.ngrok.io`

✅ **Pros**: Instant, free, no deployment needed
❌ **Cons**: Temporary URL, requires your computer to be running

---

## 🌟 Option 2: Azure App Service (Recommended for Production)

**Perfect for: Professional deployment, custom domain, scalability**

### Prerequisites
- Azure account (free tier available)
- Azure CLI installed

### Quick Deployment Steps

1. **Install Azure CLI**: https://docs.microsoft.com/en-us/cli/azure/install-azure-cli

2. **Login to Azure**:
   ```bash
   az login
   ```

3. **Create Resource Group**:
   ```bash
   az group create --name rg-portfolio --location "East US"
   ```

4. **Create App Service Plan**:
   ```bash
   az appservice plan create --name plan-portfolio --resource-group rg-portfolio --sku FREE
   ```

5. **Create Web App**:
   ```bash
   az webapp create --resource-group rg-portfolio --plan plan-portfolio --name your-unique-portfolio-name --runtime "DOTNET:9.0"
   ```

6. **Build and Deploy**:
   ```bash
   # Build frontend
   cd frontend
   npm run build
   cd ..
   
   # Publish backend
   dotnet publish MyWebsite/MyWebsite.csproj -c Release -o ./publish
   
   # Create deployment package
   Compress-Archive -Path ./publish/* -DestinationPath ./publish.zip
   
   # Deploy to Azure
   az webapp deployment source config-zip --resource-group rg-portfolio --name your-unique-portfolio-name --src publish.zip
   ```

**Your site will be available at**: `https://your-unique-portfolio-name.azurewebsites.net`

✅ **Pros**: Professional, reliable, free tier available, custom domains
❌ **Cons**: Requires Azure account, more setup

---

## 🐙 Option 3: GitHub Pages + Netlify/Vercel (Free Static Hosting)

**Perfect for: Free hosting, GitHub integration**

### For GitHub Pages (Static only):
1. Push your code to GitHub
2. Build frontend to static files
3. Enable GitHub Pages in repository settings

### For Netlify (Full-stack with serverless):
1. Push to GitHub
2. Connect repository to Netlify
3. Configure build settings
4. Deploy automatically

---

## 🌐 Option 4: Railway (Easy Full-Stack Deployment)

**Perfect for: Simple deployment, free tier**

1. **Sign up**: https://railway.app
2. **Connect GitHub** repository
3. **Deploy** with one click
4. **Get public URL** automatically

---

## 🔧 Option 5: Docker + Any Cloud Provider

**Perfect for: Containerized deployment, any cloud provider**

### Create Dockerfile:
```dockerfile
FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY ["MyWebsite/MyWebsite.csproj", "MyWebsite/"]
RUN dotnet restore "MyWebsite/MyWebsite.csproj"
COPY . .
WORKDIR "/src/MyWebsite"
RUN dotnet build "MyWebsite.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MyWebsite.csproj" -c Release -o /app/publish

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MyWebsite.dll"]
```

---

## 📋 Quick Comparison

| Option | Cost | Setup Time | Best For |
|--------|------|------------|----------|
| ngrok | Free | 5 min | Testing/Demos |
| Azure | Free tier | 15 min | Production |
| GitHub Pages | Free | 10 min | Static sites |
| Railway | Free tier | 5 min | Quick deployment |
| Docker | Varies | 20 min | Flexibility |

## 🎯 Recommended Approach

1. **Start with ngrok** for immediate testing
2. **Use Azure** for your production portfolio
3. **Set up GitHub Actions** for automated deployment (see .github/workflows/deploy.yml)

## GitHub Actions Deployment (Automated)

The included GitHub Actions workflow (`.github/workflows/deploy.yml`) will automatically deploy to Azure whenever you push to the main branch.
