# racket_reel_matches.model.State

## Load the model package
```dart
import 'package:racket_reel_matches/api.dart';
```

## Properties
Name | Type | Description | Notes
------------ | ------------- | ------------- | -------------
**createdAt** | **String** | The date and time at which this state was created. String formatted as an ISO 8601 date and time in UTC. | 
**serving** | **String** | The participant who is serving. | 
**score** | [**Map<String, ParticipantScore>**](ParticipantScore.md) | A mapping from the name of each participant as a string to their score. | [default to const {}]
**tiebreak** | **bool** | A flag to mark the time from the previous state until this state as in a tiebreak. | 
**highlight** | **bool** | A flag to mark the time from the previous state until this state as a highlight. | 

[[Back to Model list]](../README.md#documentation-for-models) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to README]](../README.md)


