# Development Environment

## Postgres

A local Postgres database can be started for development with Docker.

```sh
docker compose -f infra/postgres.docker-compose.yaml up -d
```

The connection configuration from the application to this database is already configured in `appsettings.Development.json`.

### Migrations

Add migrations

```sh
dotnet ef migrations add MigrationName
```

Remove the last migrations

```sh
dotnet ef migrations remove
```

Apply migrations

```sh
dotnet ef database update
```

## iOS and watchOS

A watchOS target has been added to Flutter's Runner project. Flutter runs the build for both the Runner and Watch targets but for iOS. Building the Watch target for iOS causes issues with the WCSessionDelegate protocol. For this reason the Flutter app cannot be built or run for iOS from the Flutter CLI or Android Studio. Instead it must be built and run directly from Xcode.


## Local HTTPS

```sh
cd infra/certs
openssl genrsa -out racketreel_certificate.key 2048
openssl req -x509 -new -nodes -key racketreel_certificate.key -sha256 -days 365 -out racketreel_certificate.crt
```

Admin PowerShell

```PowerShell
cd infra/certs
Import-Certificate -FilePath racketreel_certificate.crt -CertStoreLocation 'Cert:\LocalMachine\Root'
```

