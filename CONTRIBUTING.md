# Contributing

Start a Postgres server locally.

```sh
docker compose -f postgres.docker-compose.yaml up -d
```

Run the Swagger Viewer for interacting with the API on http://localhost:5000.

```sh
docker compose -f swagger.docker-compose.yaml up -d
```

Run a mock server based on the OpenAPI specification.

```sh
prism mock matches.oas3.json
```

Generate the server code.

```sh
openapi-generator-cli generate
```

## Codespaces

To connect to a service in Codespaces which has been port forwarded privately from Postman you need to set the `X-GitHub-Token` header. Get the token by executing `echo $GITHUB_TOKEN` from the Codespaces shell.

Build the public url as follows `https://{{codespaces_name}}-{{port}}.githubpreview.dev`. Get the Codespace name by executeing `echo $CODESPACE_NAME`.
ml