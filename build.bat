@echo off
echo 🔧 Building Portfolio Website...

REM Build frontend
echo 📦 Installing frontend dependencies...
cd frontend
call npm ci --include=dev

echo 🏗️ Building frontend...
call npm run build

REM Build backend
echo 🏗️ Building backend...
cd ..
dotnet restore MyWebsite/MyWebsite.csproj
dotnet publish MyWebsite/MyWebsite.csproj -c Release -o out

echo ✅ Build completed successfully!
