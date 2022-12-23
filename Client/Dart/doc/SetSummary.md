# racket_reel_matches.model.SetSummary

## Load the model package
```dart
import 'package:racket_reel_matches/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**completedAt** | **String** | The date and time at which this set was completed. String formatted as an ISO 8601 date and time in UTC. | 
**winner** | **String** | The name of the player which won the set. | 
**tiebreak** | **bool** | A boolean flag to indicate this set went to a tiebreak. | 
**score** | [**Map<String, ParticipantSetSummary>**](ParticipantSetSummary.md) | The summary of the score of the set for each player. Represented as a mapping from the name of each player to the summary for that player. | [default to const {}]

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


