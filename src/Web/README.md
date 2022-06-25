# Racket Reel: Web Client

This is a web client to watch matches live or replay old matches.

## Development

Automatically watch for changes and restart the development server.

```shell
dotnet watch
```

Make sure you have trusted the ASP.NET development certificate as in debug mode the development server will make try to make calls to localhost services.

```shell
dotnet dev-certs https --trust
```
