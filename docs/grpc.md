# gRPC

The backend and frontend interface via gRPC. The main `.proto` file is at `Matches.Presentation/Protos/matches.proto`. This enables server stub and client generation which is more robust than OpenAPI specifications.

## Code Generation

### Client

Follow the [quick start guide](https://grpc.io/docs/languages/dart/quickstart/) for gRPC in Dart.

Run the generator with `protoc` from the root of this repository.

```sh
protoc -I src/Matches/Matches.Presentation/Protos src/Matches/Matches.Presentation/Protos/matches.proto --dart_out=grpc:src/racketreel_mobile/lib/client google/protobuf/timestamp.proto google/protobuf/duration.proto
```

```sh
protoc -I src/RacketReel/RacketReel.Infrastructure/Users/Protos src/RacketReel/RacketReel.Infrastructure/Users/Protos/users.proto --dart_out=grpc:src/racketreel_mobile/lib/client
```

For more information see the [basics tutorial](https://grpc.io/docs/languages/dart/basics/) for gRPC in Dart.

### Server

The server stubs are generated during the build of `RacketReel.Presentation`. For troubleshooting check the build output.