# 🚂 Railway Deployment Guide

## ✨ Super Easy Railway Deployment

Railway is completely **FREE** and takes about 5 minutes to deploy your portfolio!

## 📋 Step-by-Step Deployment

### 1. **Create GitHub Repository**
First, push your code to GitHub:

```bash
# If you haven't initialized git yet
git init
git add .
git commit -m "Initial portfolio commit"

# Create repository on GitHub, then:
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git push -u origin main
```

### 2. **Deploy to Railway**

1. **Go to Railway**: https://railway.app
2. **Sign up** with your GitHub account
3. **Click "Start a New Project"**
4. **Select "Deploy from GitHub repo"**
5. **Choose your ProfileWebsite repository**
6. **Click "Deploy Now"**

That's it! Railway will automatically:
- ✅ Detect it's a .NET project
- ✅ Build your frontend
- ✅ Build your backend
- ✅ Deploy everything
- ✅ Give you a public URL

### 3. **Get Your URL**
After deployment (takes 2-3 minutes), you'll get a URL like:
`https://yourapp-production.up.railway.app`

## 🔧 Configuration Files Created

I've already created these files for you:
- ✅ `railway.json` - Railway deployment config
- ✅ `nixpacks.toml` - Build configuration
- ✅ Updated `Program.cs` - Railway-compatible settings

## 🎯 What Railway Does Automatically

1. **Builds frontend**: Compiles TypeScript, bundles assets
2. **Builds backend**: Compiles C# code
3. **Configures environment**: Sets up production settings
4. **Provides HTTPS**: Automatic SSL certificate
5. **Gives public URL**: Accessible worldwide

## 💡 Tips

### Custom Domain (Optional)
- Railway supports custom domains
- Add your domain in Railway dashboard
- Update DNS settings

### Environment Variables
Railway automatically sets:
- `PORT` - The port your app should listen on
- `ASPNETCORE_ENVIRONMENT=Production`

### Monitoring
- View logs in Railway dashboard
- Monitor deployment status
- See resource usage

## 🔄 Updates

Every time you push to GitHub:
1. **Automatic deployment** triggered
2. **New version** goes live in ~2 minutes
3. **Zero downtime** deployment

```bash
# Make changes to your code
git add .
git commit -m "Updated portfolio"
git push

# Railway automatically deploys!
```

## 🆘 Troubleshooting

### Build Fails?
- Check Railway logs in dashboard
- Ensure all dependencies in `package.json` and `.csproj`
- Verify file paths are correct

### Site Won't Load?
- Check if PORT environment variable is being used
- Verify health check endpoint `/health` works
- Check CORS settings

### API Not Working?
- Verify API endpoints in browser: `your-url.com/api/profile/info`
- Check network tab in browser dev tools

## 🎉 Success!

Once deployed, your portfolio will be:
- ✅ **Live at a public URL**
- ✅ **Automatically updated** when you push changes
- ✅ **Professional and fast**
- ✅ **Completely free**

**Example URL**: https://portfolio-production-abc123.up.railway.app

Share this URL on your resume, LinkedIn, and anywhere you want to showcase your work!

## 🔗 Useful Links

- Railway Dashboard: https://railway.app/dashboard
- Railway Docs: https://docs.railway.app
- GitHub Integration: https://docs.railway.app/deploy/deployments

**Your portfolio will be live in minutes! 🚀**
