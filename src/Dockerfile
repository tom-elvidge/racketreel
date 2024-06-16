FROM mcr.microsoft.com/dotnet/sdk:8.0 AS racketreel-matches-build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ./Matches .
RUN dotnet build Matches.Infrastructure/Matches.Infrastructure.csproj -c $BUILD_CONFIGURATION -o /app/build

FROM racketreel-matches-build AS racketreel-matches-publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish Matches.Infrastructure/Matches.Infrastructure.csproj -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS racketreel-matches
USER $APP_UID
EXPOSE 5001
WORKDIR /app
COPY --from=racketreel-matches-publish /app/publish .
ENTRYPOINT ["dotnet", "Matches.Infrastructure.dll"]

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS racketreel-api-build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY ./RacketReel .
RUN dotnet build RacketReel.Infrastructure/RacketReel.Infrastructure.csproj -c $BUILD_CONFIGURATION -o /app/build

FROM racketreel-api-build AS racketreel-api-publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish RacketReel.Infrastructure/RacketReel.Infrastructure.csproj -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS racketreel-api
USER $APP_UID
EXPOSE 5000
WORKDIR /app
COPY --from=racketreel-api-publish /app/publish .
ENTRYPOINT ["dotnet", "RacketReel.Infrastructure.dll"]

FROM mcr.microsoft.com/dotnet/sdk:8.0 AS racketreel-web-build
ARG BUILD_CONFIGURATION=Release
WORKDIR /src
COPY . .
RUN dotnet build RacketReel/RacketReel.Web/RacketReel.Web.csproj -c $BUILD_CONFIGURATION -o /app/build

FROM racketreel-web-build AS racketreel-web-publish
ARG BUILD_CONFIGURATION=Release
RUN dotnet publish RacketReel/RacketReel.Web/RacketReel.Web.csproj -c $BUILD_CONFIGURATION -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:8.0 AS racketreel-web
USER $APP_UID
EXPOSE 8080
EXPOSE 8081
WORKDIR /app
COPY --from=racketreel-web-publish /app/publish .
ENTRYPOINT ["dotnet", "RacketReel.Web.dll"]