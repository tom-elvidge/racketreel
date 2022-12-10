# Racket Reel: Matches Service

A REST service to configure and score tennis matches.

This has been written following Domain Driven Design patterns for C# .NET Core projects, read more [here](https://docs.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/ddd-oriented-microservice). As such there are three C# projects for the [API](Matches.API/), [Domain](Matches.Domain/) and [Infrastructure](Matches.Infrastructure/).

## Examples

### Create a new match

Make a `POST` request to `{{baseurl}}/api/v1/matches` with the match configuration in the body.

```json
{
	"players": [
		"Tom Elvidge",
		"Joe Bloggs"
	],
	"servingFirst": "Joe Bloggs",
	"sets": 3,
	"setType": "SixAllAdvantageRule",
	"finalSetType": "SixAllAdvantageRule"
}
```

This should respond with a `201 Created` status and the new match resource in the body.

```json
{
    "id": 5,
    "createdDateTime": "2022-06-19T13:21:24.345353Z",
    "players": [
        "Tom Elvidge",
        "Joe Bloggs"
    ],
    "servingFirst": "Joe Bloggs",
    "sets": 3,
    "setType": "SixAllAdvantageRule",
    "finalSetType": "SixAllAdvantageRule",
    "states": [
        {
            "createdDateTime": "2022-06-19T13:21:24.345538Z",
            "serving": "Joe Bloggs",
            "score": {
                "Tom Elvidge": {
                    "points": 0,
                    "games": 0,
                    "sets": 0
                },
                "Joe Bloggs": {
                    "points": 0,
                    "games": 0,
                    "sets": 0
                }
            },
            "isTieBreak": false
        }
    ]
}
```

### Score to an existing match

Make a `POST` request to `{baseUrl}/api/v1/matches/{matchId}/states` with the participant which won the point in the body.

```json
{
    "pointTo": "Tom Elvidge"
}
```

This should respond with a `201 Created` status and the new match state resource in the body.

```json
{
    "createdDateTime": "2022-06-19T13:21:28.840372Z",
    "serving": "Tom Elvidge",
    "score": {
        "Tom Elvidge": {
            "points": 1,
            "games": 0,
            "sets": 0
        },
        "Joe Bloggs": {
            "points": 0,
            "games": 0,
            "sets": 0
        }
    },
    "isTieBreak": false
}
```

## Development

This service depends on a Postgres database which can be set up for development with `docker-compose up -d` from the root of this repository.

Run locally with a debugger in Visual Studio Code by going to Run > Start Debugging or just press F5.

## Deployment

Install `gcloud`  and login

```sh
gcloud auth login
```

I have already created a project in with the id `tomelvidge` for POC projects so set this as the current project

```sh
gcloud config set project tomelvidge
```

Deploy the application to Cloud Run from source

```sh
gcloud run deploy racketreel-matches \
	--source=./ \
	--region=europe-west1 \
	--min-instances=0 \
	--max-instances=4 \
	--allow-unauthenticated \
	--set-env-vars='DatabaseConfig__Host'='...','DatabaseConfig__Port'='...','DatabaseConfig__Username'='...','DatabaseConfig__Password'='...','DatabaseConfig__Database'='...','AuthConfig__Authority'='...','AuthConfig__Audience'='...'
```

### Todo

- Handle errors from MatchAggregate in API layer
- Add IsTieBreak, IsGamePoint, IsComplete etc to API responses
- Add created user to match
- Only allow users to add states or delete their own matches
- Create bot which ensures there is always a demo match in progress with regular updates (random cron job az func to update score)
- Interactive notebook for onboarding


todo:
- separate presentation from infrastructure, and explain why
- generate openapi spec at build time (find a way to generate clients in CI and/or locally)