FROM mcr.microsoft.com/dotnet/core/sdk:3.1 AS build-env
WORKDIR /app
# Copiar csproj e restaurar dependencias
COPY *.csproj ./

RUN pwsh -Command Write-Host "Mvc31: Gerando imagem Docker e testando o PowerShell Core"
# Build da aplicacao
COPY . ./

# Build da imagem
FROM mcr.microsoft.com/dotnet/core/aspnet:3.1
WORKDIR /app

ENTRYPOINT ["dotnet", "mvc31.dll"]