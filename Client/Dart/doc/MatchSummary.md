# racket_reel_matches.model.MatchSummary

## Load the model package
```dart
import 'package:racket_reel_matches/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**completedAt** | **String** | The date and time at which this match was completed. String formatted as an ISO 8601 date and time in UTC. | 
**winner** | **String** | The name of the player which won the set. | 
**sets** | [**Map<String, SetSummary>**](SetSummary.md) | The summary of the score for each set. Represented as a mapping from the set index (0, 1, 2, etc) to the summary of that set. | [default to const {}]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


