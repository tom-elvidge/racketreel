# Contributing

Start a postgres server locally.

```shell
docker-compose up -d
```

## Codespaces

To connect to a service in Codespaces which has been port forwarded privately from Postman you need to set the `X-GitHub-Token' header. Get the token by executing `echo $GITHUB_TOKEN` from the Codespaces shell.

Build the public url as follows `https://{{codespaces_name}}-{{port}}.githubpreview.dev`. Get the Codespace name by executeing `echo $CODESPACE_NAME`.
