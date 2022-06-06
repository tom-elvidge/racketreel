# Racket Reel: Matches Service

A simple CRUD service for matches.

Start the development database.

```bash
docker run -e 'ACCEPT_EULA=Y' -e 'MSSQL_SA_PASSWORD=1StrongPassword' -p 1433:1433 -d mcr.microsoft.com/mssql/server:2019-latest
```
