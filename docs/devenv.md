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