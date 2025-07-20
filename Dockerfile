FROM mcr.microsoft.com/dotnet/aspnet:9.0 AS base
WORKDIR /app
EXPOSE 80
EXPOSE 443

FROM node:20 AS frontend-build
WORKDIR /src/frontend
COPY frontend/package*.json ./
# Install all dependencies including devDependencies for build
RUN npm ci --include=dev
COPY frontend/ ./
# Fix permissions for node_modules binaries after copying files
RUN chmod +x ./node_modules/.bin/* || true
# Use absolute paths and ensure permissions
RUN npx --yes tsc && npx --yes vite build

FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build
WORKDIR /src
COPY ["MyWebsite/MyWebsite.csproj", "MyWebsite/"]
RUN dotnet restore "MyWebsite/MyWebsite.csproj"
COPY MyWebsite/ MyWebsite/
COPY --from=frontend-build /src/frontend/dist/ MyWebsite/wwwroot/
WORKDIR "/src/MyWebsite"
RUN dotnet build "MyWebsite.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "MyWebsite.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "MyWebsite.dll"]
