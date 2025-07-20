#!/bin/bash

echo "🔧 Building Portfolio Website..."

# Build frontend
echo "📦 Installing frontend dependencies..."
cd frontend
npm ci --include=dev

echo "🏗️ Building frontend..."
npm run build

# Build backend
echo "🏗️ Building backend..."
cd ..
dotnet restore MyWebsite/MyWebsite.csproj
dotnet publish MyWebsite/MyWebsite.csproj -c Release -o out

echo "✅ Build completed successfully!"
