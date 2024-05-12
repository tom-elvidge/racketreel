FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS base
USER $APP_UID
WORKDIR /app
EXPOSE 5000

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY . .
RUN dotnet restore RacketReel.Application/RacketReel.Application.csproj && \
dotnet restore RacketReel.Domain/RacketReel.Domain.csproj && \
dotnet restore RacketReel.Infrastructure/RacketReel.Infrastructure.csproj
RUN dotnet build RacketReel.Infrastructure/RacketReel.Infrastructure.csproj -c $BUILD_CONFIGURATION -o /app/build

FROM build AS publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish RacketReel.Infrastructure/RacketReel.Infrastructure.csproj -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
ENTRYPOINT ["dotnet", "RacketReel.Infrastructure.dll"]
