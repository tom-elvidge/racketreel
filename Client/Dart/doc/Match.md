# racket_reel_matches.model.Match

## Load the model package
```dart
import 'package:racket_reel_matches/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**id** | **int** | A unique identifier for this match. | 
**createdAt** | **String** | The date and time at which this match was created. String formatted as an ISO 8601 date and time in UTC. | 
**completedAt** | **String** | The date and time at which this match was completed. String formatted as an ISO 8601 date and time in UTC. Only included if the match has been completed. | [optional] 
**participants** | **List<String>** | The list of participants in this match. | [default to const []]
**servingFirst** | **String** | The participant who is serving first. | 
**format** | [**MatchFormatEnum**](MatchFormatEnum.md) |  | 
**states** | [**List<State>**](State.md) | The list of all the states in the match ordered by the created date and time. | [optional] [default to const []]
**summary** | [**MatchSummary**](MatchSummary.md) |  | [optional] 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


