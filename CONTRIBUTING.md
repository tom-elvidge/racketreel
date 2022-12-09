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

Generate the client code.

```sh
openapi-generator-cli generate
```

Due to a bug in the generator you must manually change line 72 in `match_state.dart` from `score: PlayerScore.mapFromJson(json[r'score'!,` to `score: PlayerScore.mapFromJson(json[r'score']!)`.

Publish the client.

```sh
cd Client/Dart
dart pub publish
```

## Codespaces

To connect to a service in Codespaces which has been port forwarded privately from Postman you need to set the `X-GitHub-Token` header. Get the token by executing `echo $GITHUB_TOKEN` from the Codespaces shell.

Build the public url as follows `https://{{codespaces_name}}-{{port}}.githubpreview.dev`. Get the Codespace name by executeing `echo $CODESPACE_NAME`.
ml

## Publishing changes

Update the CHANGELOG.md of the client. Update the service version in `matches.oas3.json`. Update the version to match in `openapitools.json`.

Run the generator. Go through the diff of the changes in git, keeping any necessary changes where the generator failed. 

Publish the Dart package with the new version.

Commit and push to git.

## Swashbuckle

Starting from a fully documented ASP.NET service. Use Swashbuckle to generate a OpenAPI specification. This should be done at build time to enable client generation during CI. This is documented [here](https://khalidabuhakmeh.com/generate-aspnet-core-openapi-spec-at-build-time).

Proposed change process:

- Make changes to `Matches.Application`, `Matches.Domain` and `Matches.Infrastructure` as necessary
- Make changes to `Matches.Presentation` to add API endpoints, DTOs and documentation
- Commit and push to trigger CI process
  - Build `Matches.Presentation` which will generate an OpenAPI specification
  - Build a Docker image for the server
  - Generate a Dart client from the generated OpenAPI specification
  - Publish the Docker image and Helm chart for the server, and the Dart client
