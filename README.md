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

### Todo

- Complete MatchAggregate scoring logic
- Fully unit test scoring logic
- Handle errors from MatchAggregate in API layer
- Add IsTieBreak, IsGamePoint, IsComplete etc to API responses
- Scaffold caching system for these states?
- Add auth0 authentication with user ids
- Add created user to match
- Add authorization check for create match and add state endpoints
- Create bot which ensures there is always a demo match in progress with regular updates (random cron job az func to update score)