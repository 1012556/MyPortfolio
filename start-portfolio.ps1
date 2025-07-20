# Portfolio Website Launcher
# Choose between local development or Railway deployment

Write-Host "Portfolio Website Launcher" -ForegroundColor Green
Write-Host "=========================" -ForegroundColor Green
Write-Host ""
Write-Host "Choose how to run your portfolio:" -ForegroundColor Cyan
Write-Host "1. Run locally (for development)"
Write-Host "2. Open Railway website (public URL)"

$choice = Read-Host "Enter your choice (1-2)"

switch ($choice) {
    "1" {
        Write-Host "Starting local development environment..." -ForegroundColor Green
        Write-Host "========================================" -ForegroundColor Green
        
        # Check if backend is running
        try {
            $response = Invoke-WebRequest -Uri "http://localhost:5067/api/profile/info" -TimeoutSec 3 -UseBasicParsing
            Write-Host "Backend already running on http://localhost:5067" -ForegroundColor Yellow
        } catch {
            Write-Host "Starting backend..." -ForegroundColor Cyan
            Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\MyWebsite'; Write-Host 'Starting C# Backend...' -ForegroundColor Green; dotnet run"
            Write-Host "Waiting for backend to start..." -ForegroundColor Yellow
            Start-Sleep -Seconds 8
        }
        
        # Open local website
        Write-Host "Opening local website..." -ForegroundColor Green
        Start-Process "http://localhost:5067"
        
        Write-Host ""
        Write-Host "Local development is running!" -ForegroundColor Green
        Write-Host "Backend: http://localhost:5067" -ForegroundColor Cyan
        Write-Host "You can edit files and see changes immediately." -ForegroundColor Yellow
    }
    "2" {
        Write-Host "Opening Railway deployment..." -ForegroundColor Green
        Write-Host "============================" -ForegroundColor Green
        
        Write-Host "Your portfolio is deployed on Railway!" -ForegroundColor Green
        Write-Host "Opening Railway dashboard and your public website..." -ForegroundColor Cyan
        
        # Open Railway dashboard
        Start-Process "https://railway.app/dashboard"
        
        Write-Host ""
        Write-Host "Railway Info:" -ForegroundColor Cyan
        Write-Host "• Your website is publicly accessible" -ForegroundColor White
        Write-Host "• Automatic deployments from GitHub" -ForegroundColor White
        Write-Host "• Free hosting with Railway" -ForegroundColor White
        Write-Host "• Check the dashboard for your public URL" -ForegroundColor Yellow
    }
    default {
        Write-Host "Invalid choice. Starting local development..." -ForegroundColor Yellow
        Write-Host "Starting backend..." -ForegroundColor Cyan
        Start-Process powershell -ArgumentList "-NoExit", "-Command", "cd '$PSScriptRoot\MyWebsite'; dotnet run"
        Start-Sleep -Seconds 5
        Start-Process "http://localhost:5067"
    }
}

Write-Host ""
Write-Host "Portfolio ready!" -ForegroundColor Green
Write-Host "Remember to update your information in MyWebsite/Services/ProfileService.cs" -ForegroundColor Yellow
Read-Host "Press Enter to exit"
