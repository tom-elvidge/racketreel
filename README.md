# Racket Reel Matches

A REST service to configure and score tennis matches.

This has been written following Domain Driven Design patterns for C# .NET Core projects, read more [here](https://docs.microsoft.com/en-us/dotnet/architecture/microservices/microservice-ddd-cqrs-patterns/ddd-oriented-microservice). As such there are three C# projects for the [API](Matches.API/), [Domain](Matches.Domain/) and [Infrastructure](Matches.Infrastructure/).

## Example

Create a new match by making a `POST` request to `{{baseurl}}/api/v1/matches` with the configuration in the body.

```json
{
	"participants": [
		"Joe Bloggs",
        "John Smith"
	],
	"servingFirst": "John Smith",
    "format": "TiebreakToTen"
}
```

This should respond with a `201 Created` status and the new match resource in the body.

```json
{
    "id": 1,
    "createdAt": "2022-12-23T21:04:58.1666340Z",
    "participants": [
        "Joe Bloggs",
        "John Smith"
    ],
    "servingFirst": "John Smith",
    "format": "TiebreakToTen",
    "states": [
        {
            "createdAt": "2022-12-23T21:04:58.1666490Z",
            "serving": "John Smith",
            "score": {
                "Joe Bloggs": {
                    "points": 0,
                    "games": 0,
                    "sets": 0
                },
                "John Smith": {
                    "points": 0,
                    "games": 0,
                    "sets": 0
                }
            },
            "tiebreak": true,
            "highlight": false
        }
    ]
}
```

Score to this match by making  `POST` requests to `{baseUrl}/api/v1/matches/{matchId}/states` with the participant which won the point in the body.

```json
{
    "participant": "John Smith"
}
```

This should respond with a `201 Created` status and the new state which was created in the body.

```json
{
    "createdAt": "2022-12-23T21:07:09.9488810Z",
    "serving": "Joe Bloggs",
    "score": {
        "Joe Bloggs": {
            "points": 0,
            "games": 0,
            "sets": 0
        },
        "John Smith": {
            "points": 1,
            "games": 0,
            "sets": 0
        }
    },
    "tiebreak": true,
    "highlight": false
}
```

See the OpenAPI specification for more examples.

### Todo

- Add created user to match
- Add authorization so users can only add or delete states from their own matches
- Create a websocket service for listening to updates to a match
- Create bot which ensures there is always a demo match in progress with regular updates (random cron job az func to update score)

### Generating gRPC from protobuf

#### Client

Follow the [quick start guide](https://grpc.io/docs/languages/dart/quickstart/) for gRPC in Dart.

Run the generator with `protoc` from the root of this repository.

```sh
protoc -I src/RacketReel.Presentation/Protos src/RacketReel.Presentation/Protos/matches.proto --dart_out=grpc:src/racketreel_client/generated
```

For more information see the [basics tutorial](https://grpc.io/docs/languages/dart/basics/) for gRPC in Dart.

#### Server

The server stubs are generated during the build of `RacketReel.Presentation`. For troubleshooting check the build output.