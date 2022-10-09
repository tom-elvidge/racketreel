# racket_reel_matches

A client for interacting with the Matches service of [Racket Reel](https://www.racketreel.com). Functionality for creating tennis matches and scoring them.

## Requirements

Dart 2.12 or later

## Getting Started

Get all the existing matches.

```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = MatchesApi();
final pageSize = 10; // How many items to return per page
final pageNumber = 1; // Which page to return

try {
    final result = api_instance.listMatches(pageSize, pageNumber);
    print(result);
} catch (e) {
    print('Exception when calling MatchesApi->listMatches: $e\n');
}
```

Get a specific match.

```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = MatchApi();
final matchId = 56; // The id of the match to get

try {
    final result = api_instance.getMatch(matchId);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->getMatch: $e\n');
}
```

Configure and create a new match.

```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = MatchesApi();
final players = ["Joe Bloggs", "John Smith"]
final servingFirst = "Joe Bloggs"
final sets = 3
final setType = "SixAllAdvantageRule"
final finalSetType = "SixAllAdvantageRule"
final createMatchRequest = CreateMatchRequest(players, servingFirst, sets, setType, finalSetType);

try {
    final result = api_instance.createMatch(createMatchRequest);
    print(result);
} catch (e) {
    print('Exception when calling MatchesApi->createMatch: $e\n');
}
```

Update the score of an existing match.

```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = MatchApi();
final matchId = 56; // The id of the match to create a state for
final pointTo = "Joe Bloggs" //  The player who won the point
final createMatchStateRequest = CreateMatchStateRequest(pointTo);

try {
    final result = api_instance.createMatchState(matchId, createMatchStateRequest);
    print(result);
} catch (e) {
    print('Exception when calling MatchApi->createMatchState: $e\n');
}
```
