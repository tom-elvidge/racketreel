# racket_reel_matches.api.StateApi

## Load the API package
```dart
import 'package:racket_reel_matches/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createMatchState**](StateApi.md#creatematchstate) | **POST** /api/v1/matches/{matchId}/states | Create a new match state
[**deleteLatestMatchState**](StateApi.md#deletelatestmatchstate) | **DELETE** /api/v1/matches/{matchId}/states/latest | Delete latest match state
[**getLatestMatchState**](StateApi.md#getlatestmatchstate) | **GET** /api/v1/matches/{matchId}/states/latest | Get latest match state
[**getMatchState**](StateApi.md#getmatchstate) | **GET** /api/v1/matches/{matchId}/states/{stateId} | Get match state
[**updateLatestMatchState**](StateApi.md#updatelatestmatchstate) | **PUT** /api/v1/matches/{matchId}/states/latest | Update the latest match state
[**updateMatchState**](StateApi.md#updatematchstate) | **PUT** /api/v1/matches/{matchId}/states/{stateId} | Update the match state


# **createMatchState**
> CreateMatchState201Response createMatchState(matchId, createMatchStateRequest)

Create a new match state

### Example
```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = StateApi();
final matchId = 56; // int | The id of the match to create a state for
final createMatchStateRequest = CreateMatchStateRequest(); // CreateMatchStateRequest | 

try {
    final result = api_instance.createMatchState(matchId, createMatchStateRequest);
    print(result);
} catch (e) {
    print('Exception when calling StateApi->createMatchState: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matchId** | **int**| The id of the match to create a state for | 
 **createMatchStateRequest** | [**CreateMatchStateRequest**](CreateMatchStateRequest.md)|  | 

### Return type

[**CreateMatchState201Response**](CreateMatchState201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **deleteLatestMatchState**
> deleteLatestMatchState(matchId)

Delete latest match state

### Example
```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = StateApi();
final matchId = 56; // int | The id of the match to get

try {
    api_instance.deleteLatestMatchState(matchId);
} catch (e) {
    print('Exception when calling StateApi->deleteLatestMatchState: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matchId** | **int**| The id of the match to get | 

### Return type

void (empty response body)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getLatestMatchState**
> CreateMatchState201Response getLatestMatchState(matchId)

Get latest match state

### Example
```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = StateApi();
final matchId = 56; // int | The id of the match to get

try {
    final result = api_instance.getLatestMatchState(matchId);
    print(result);
} catch (e) {
    print('Exception when calling StateApi->getLatestMatchState: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matchId** | **int**| The id of the match to get | 

### Return type

[**CreateMatchState201Response**](CreateMatchState201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **getMatchState**
> CreateMatchState201Response getMatchState(matchId, stateId)

Get match state

### Example
```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = StateApi();
final matchId = 56; // int | The id of the match to get
final stateId = 56; // int | The id of the state to get

try {
    final result = api_instance.getMatchState(matchId, stateId);
    print(result);
} catch (e) {
    print('Exception when calling StateApi->getMatchState: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matchId** | **int**| The id of the match to get | 
 **stateId** | **int**| The id of the state to get | 

### Return type

[**CreateMatchState201Response**](CreateMatchState201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateLatestMatchState**
> CreateMatchState201Response updateLatestMatchState(matchId, updateMatchStateRequest)

Update the latest match state

### Example
```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = StateApi();
final matchId = 56; // int | The id of the match to update the latest state of
final updateMatchStateRequest = UpdateMatchStateRequest(); // UpdateMatchStateRequest | 

try {
    final result = api_instance.updateLatestMatchState(matchId, updateMatchStateRequest);
    print(result);
} catch (e) {
    print('Exception when calling StateApi->updateLatestMatchState: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matchId** | **int**| The id of the match to update the latest state of | 
 **updateMatchStateRequest** | [**UpdateMatchStateRequest**](UpdateMatchStateRequest.md)|  | 

### Return type

[**CreateMatchState201Response**](CreateMatchState201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **updateMatchState**
> CreateMatchState201Response updateMatchState(matchId, stateId, updateMatchStateRequest)

Update the match state

### Example
```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = StateApi();
final matchId = 56; // int | The id of the match to update
final stateId = 56; // int | The id of the state to update
final updateMatchStateRequest = UpdateMatchStateRequest(); // UpdateMatchStateRequest | 

try {
    final result = api_instance.updateMatchState(matchId, stateId, updateMatchStateRequest);
    print(result);
} catch (e) {
    print('Exception when calling StateApi->updateMatchState: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matchId** | **int**| The id of the match to update | 
 **stateId** | **int**| The id of the state to update | 
 **updateMatchStateRequest** | [**UpdateMatchStateRequest**](UpdateMatchStateRequest.md)|  | 

### Return type

[**CreateMatchState201Response**](CreateMatchState201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

