FROM microsoft/aspnetcore:2.0-nanoserver-1709 AS base
WORKDIR /app
EXPOSE 80

FROM microsoft/aspnetcore-build:2.0-nanoserver-1709 AS build
WORKDIR /src
COPY src/Sigma.PatrimonioApi.csproj src/
RUN dotnet restore src/Sigma.PatrimonioApi.csproj
COPY . .
WORKDIR /src/src
RUN dotnet build Sigma.PatrimonioApi.csproj -c Release -o /app

FROM build AS publish
RUN dotnet publish Sigma.PatrimonioApi.csproj -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "Sigma.PatrimonioApi.dll"]
