# racket_reel_matches.api.StatesApi

## Load the API package
```dart
import 'package:racket_reel_matches/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1MatchesMatchIdStatesLatestDelete**](StatesApi.md#apiv1matchesmatchidstateslatestdelete) | **DELETE** /api/v1/matches/{matchId}/states/latest | Delete the latest state from the match with id matchId.
[**apiV1MatchesMatchIdStatesLatestGet**](StatesApi.md#apiv1matchesmatchidstateslatestget) | **GET** /api/v1/matches/{matchId}/states/latest | Get the latest state from the match with id matchId.
[**apiV1MatchesMatchIdStatesLatestPut**](StatesApi.md#apiv1matchesmatchidstateslatestput) | **PUT** /api/v1/matches/{matchId}/states/latest | Update the latest state from the match with id matchId.
[**apiV1MatchesMatchIdStatesPost**](StatesApi.md#apiv1matchesmatchidstatespost) | **POST** /api/v1/matches/{matchId}/states | Create a new match state when a participant scores a point.
[**apiV1MatchesMatchIdStatesStateIndexGet**](StatesApi.md#apiv1matchesmatchidstatesstateindexget) | **GET** /api/v1/matches/{matchId}/states/{stateIndex} | Get the state with index stateIndex from the match with id matchId.
[**apiV1MatchesMatchIdStatesStateIndexPut**](StatesApi.md#apiv1matchesmatchidstatesstateindexput) | **PUT** /api/v1/matches/{matchId}/states/{stateIndex} | Update the state with index stateIndex from the match with id matchId.


# **apiV1MatchesMatchIdStatesLatestDelete**
> apiV1MatchesMatchIdStatesLatestDelete(matchId)

Delete the latest state from the match with id matchId.

### Example
```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = StatesApi();
final matchId = 56; // int | The id of the match to update the state from.

try {
    api_instance.apiV1MatchesMatchIdStatesLatestDelete(matchId);
} catch (e) {
    print('Exception when calling StatesApi->apiV1MatchesMatchIdStatesLatestDelete: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matchId** | **int**| The id of the match to update the state from. | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MatchesMatchIdStatesLatestGet**
> State apiV1MatchesMatchIdStatesLatestGet(matchId)

Get the latest state from the match with id matchId.

### Example
```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = StatesApi();
final matchId = 56; // int | The id of the match to get the latest state from.

try {
    final result = api_instance.apiV1MatchesMatchIdStatesLatestGet(matchId);
    print(result);
} catch (e) {
    print('Exception when calling StatesApi->apiV1MatchesMatchIdStatesLatestGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matchId** | **int**| The id of the match to get the latest state from. | 

### Return type

[**State**](State.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MatchesMatchIdStatesLatestPut**
> State apiV1MatchesMatchIdStatesLatestPut(matchId, updateStateRequestBody)

Update the latest state from the match with id matchId.

### Example
```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = StatesApi();
final matchId = 56; // int | The id of the match to update the state from.
final updateStateRequestBody = UpdateStateRequestBody(); // UpdateStateRequestBody | 

try {
    final result = api_instance.apiV1MatchesMatchIdStatesLatestPut(matchId, updateStateRequestBody);
    print(result);
} catch (e) {
    print('Exception when calling StatesApi->apiV1MatchesMatchIdStatesLatestPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matchId** | **int**| The id of the match to update the state from. | 
 **updateStateRequestBody** | [**UpdateStateRequestBody**](UpdateStateRequestBody.md)|  | [optional] 

### Return type

[**State**](State.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MatchesMatchIdStatesPost**
> State apiV1MatchesMatchIdStatesPost(matchId, createStateRequestBody)

Create a new match state when a participant scores a point.

### Example
```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = StatesApi();
final matchId = 56; // int | The id of the match to create a state for.
final createStateRequestBody = CreateStateRequestBody(); // CreateStateRequestBody | The request body which should specify the participant which scored the point.

try {
    final result = api_instance.apiV1MatchesMatchIdStatesPost(matchId, createStateRequestBody);
    print(result);
} catch (e) {
    print('Exception when calling StatesApi->apiV1MatchesMatchIdStatesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matchId** | **int**| The id of the match to create a state for. | 
 **createStateRequestBody** | [**CreateStateRequestBody**](CreateStateRequestBody.md)| The request body which should specify the participant which scored the point. | [optional] 

### Return type

[**State**](State.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MatchesMatchIdStatesStateIndexGet**
> State apiV1MatchesMatchIdStatesStateIndexGet(matchId, stateIndex)

Get the state with index stateIndex from the match with id matchId.

### Example
```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = StatesApi();
final matchId = 56; // int | The id of the match to get the state from.
final stateIndex = 56; // int | The index of state in the match to get.

try {
    final result = api_instance.apiV1MatchesMatchIdStatesStateIndexGet(matchId, stateIndex);
    print(result);
} catch (e) {
    print('Exception when calling StatesApi->apiV1MatchesMatchIdStatesStateIndexGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matchId** | **int**| The id of the match to get the state from. | 
 **stateIndex** | **int**| The index of state in the match to get. | 

### Return type

[**State**](State.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MatchesMatchIdStatesStateIndexPut**
> State apiV1MatchesMatchIdStatesStateIndexPut(matchId, stateIndex, updateStateRequestBody)

Update the state with index stateIndex from the match with id matchId.

### Example
```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = StatesApi();
final matchId = 56; // int | The id of the match to update the state from.
final stateIndex = 56; // int | The index of state in the match to update.
final updateStateRequestBody = UpdateStateRequestBody(); // UpdateStateRequestBody | 

try {
    final result = api_instance.apiV1MatchesMatchIdStatesStateIndexPut(matchId, stateIndex, updateStateRequestBody);
    print(result);
} catch (e) {
    print('Exception when calling StatesApi->apiV1MatchesMatchIdStatesStateIndexPut: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matchId** | **int**| The id of the match to update the state from. | 
 **stateIndex** | **int**| The index of state in the match to update. | 
 **updateStateRequestBody** | [**UpdateStateRequestBody**](UpdateStateRequestBody.md)|  | [optional] 

### Return type

[**State**](State.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json-patch+json, application/json, text/json, application/*+json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

