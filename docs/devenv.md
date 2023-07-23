# Development Environment

## Postgres

A local Postgres database can be started for development with Docker.

```sh
docker compose -f infra/postgres.docker-compose.yaml up -d
```

The connection configuration from the application to this database is already configured in `appsettings.Development.json`.

All the database configuration is done the first time the application is started.