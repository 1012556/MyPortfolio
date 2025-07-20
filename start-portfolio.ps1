# Quick Start Script for Public URL
# This script will help you quickly share your portfolio with others

Write-Host "Portfolio Website Quick Share" -ForegroundColor Green
Write-Host "=============================" -ForegroundColor Green

# Check if backend is running
try {
    $response = Invoke-WebRequest -Uri "http://localhost:5067/api/profile/info" -TimeoutSec 5 -UseBasicParsing
    Write-Host "Backend is running on http://localhost:5067" -ForegroundColor Green
} catch {
    Write-Host "Backend not running. Starting it now..." -ForegroundColor Yellow
    Write-Host "Opening new terminal for backend..." -ForegroundColor Cyan
    Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\MyWebsite'; dotnet run"
    Write-Host "Waiting for backend to start..." -ForegroundColor Yellow
    Start-Sleep -Seconds 10
}

Write-Host ""
Write-Host "Choose your deployment option:" -ForegroundColor Cyan
Write-Host "1. Quick public URL (localtunnel - instant)"
Write-Host "2. Free permanent hosting (Railway/Render)"
Write-Host "3. Azure App Service (professional)"
Write-Host "4. Open deployment guide"
Write-Host "5. Just open local website"

$choice = Read-Host "Enter your choice (1-5)"

switch ($choice) {
    "1" {
        Write-Host "Creating instant public URL with localtunnel..." -ForegroundColor Green
        Write-Host "This is temporary but works immediately!" -ForegroundColor Yellow
        Write-Host "Installing localtunnel..." -ForegroundColor Cyan
        
        try {
            npm install -g localtunnel 2>$null
            Write-Host "Starting tunnel..." -ForegroundColor Green
            Start-Process powershell -ArgumentList "-NoExit", "-Command", "npx localtunnel --port 5067"
            Write-Host "Your public URL will appear in the new window!" -ForegroundColor Green
        } catch {
            Write-Host "Error starting localtunnel. Make sure Node.js is installed." -ForegroundColor Red
        }
    }
    "2" {
        Write-Host "Free Permanent Hosting Options:" -ForegroundColor Green
        Write-Host "================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "Option A: Railway (Easiest)" -ForegroundColor Cyan
        Write-Host "1. Go to: https://railway.app" -ForegroundColor White
        Write-Host "2. Sign up with GitHub" -ForegroundColor White
        Write-Host "3. Connect this repository" -ForegroundColor White
        Write-Host "4. Deploy with one click!" -ForegroundColor White
        Write-Host ""
        Write-Host "Option B: Render" -ForegroundColor Cyan
        Write-Host "1. Go to: https://render.com" -ForegroundColor White
        Write-Host "2. Sign up with GitHub" -ForegroundColor White
        Write-Host "3. Create new Web Service" -ForegroundColor White
        Write-Host "4. Connect your repository" -ForegroundColor White
        Write-Host ""
        Write-Host "Both are FREE and give you a permanent URL!" -ForegroundColor Green
        
        $freeChoice = Read-Host "Open Railway (r) or Render (n) or both (b)?"
        if ($freeChoice -eq "r" -or $freeChoice -eq "R") {
            Start-Process "https://railway.app"
        } elseif ($freeChoice -eq "n" -or $freeChoice -eq "N") {
            Start-Process "https://render.com"
        } else {
            Start-Process "https://railway.app"
            Start-Process "https://render.com"
        }
    }
    "3" {
        Write-Host "Azure App Service (Professional Option)" -ForegroundColor Green
        Write-Host "=======================================" -ForegroundColor Green
        Write-Host ""
        Write-Host "Pricing:" -ForegroundColor Cyan
        Write-Host "• First 12 months: FREE (with free Azure account)" -ForegroundColor Green
        Write-Host "• After 12 months: ~$13-15/month (Basic tier)" -ForegroundColor Yellow
        Write-Host "• Always free option: F1 tier (limited)" -ForegroundColor Yellow
        Write-Host ""
        Write-Host "Benefits:" -ForegroundColor Cyan
        Write-Host "• Professional URLs" -ForegroundColor White
        Write-Host "• Custom domains" -ForegroundColor White
        Write-Host "• SSL certificates" -ForegroundColor White
        Write-Host "• Scaling options" -ForegroundColor White
        Write-Host ""
        
        $azureChoice = Read-Host "Continue with Azure setup? (y/n)"
        if ($azureChoice -eq "y" -or $azureChoice -eq "Y") {
            Write-Host "Opening Azure portal and deployment guide..." -ForegroundColor Green
            Start-Process "https://portal.azure.com"
            if (Test-Path "$PSScriptRoot\DEPLOYMENT.md") {
                Start-Process "$PSScriptRoot\DEPLOYMENT.md"
            }
        }
    }
    "4" {
        Write-Host "Opening deployment guide..." -ForegroundColor Green
        if (Test-Path "$PSScriptRoot\DEPLOYMENT.md") {
            Start-Process "$PSScriptRoot\DEPLOYMENT.md"
        } else {
            Write-Host "Check DEPLOYMENT.md in your project folder" -ForegroundColor Yellow
        }
    }
    "5" {
        Write-Host "Opening local website..." -ForegroundColor Green
        Start-Process "http://localhost:5067"
    }
    default {
        Write-Host "Invalid choice. Opening local website..." -ForegroundColor Yellow
        Start-Process "http://localhost:5067"
    }
}

Write-Host ""
Write-Host "Your portfolio is ready!" -ForegroundColor Green
Write-Host "Don't forget to update your information in MyWebsite/Services/ProfileService.cs" -ForegroundColor Yellow
Read-Host "Press Enter to exit"
