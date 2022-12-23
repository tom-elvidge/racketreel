# racket_reel_matches.api.MatchesApi

## Load the API package
```dart
import 'package:racket_reel_matches/api.dart';
```

All URIs are relative to *http://localhost*

Method | HTTP request | Description
------------- | ------------- | -------------
[**apiV1MatchesGet**](MatchesApi.md#apiv1matchesget) | **GET** /api/v1/matches | Get a page of matches from the collection of all ordered matches.
[**apiV1MatchesMatchIdGet**](MatchesApi.md#apiv1matchesmatchidget) | **GET** /api/v1/matches/{matchId} | Get the match with id.
[**apiV1MatchesPost**](MatchesApi.md#apiv1matchespost) | **POST** /api/v1/matches | Create a new match from a configuration.


# **apiV1MatchesGet**
> MatchPaginated apiV1MatchesGet(pageSize, pageNumber, orderBy)

Get a page of matches from the collection of all ordered matches.

### Example
```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = MatchesApi();
final pageSize = 56; // int | The maximum number of matches to include on a page.
final pageNumber = 56; // int | The page of matches to get.
final orderBy = ; // MatchesOrderByEnum | How to order the collection of matches.

try {
    final result = api_instance.apiV1MatchesGet(pageSize, pageNumber, orderBy);
    print(result);
} catch (e) {
    print('Exception when calling MatchesApi->apiV1MatchesGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageSize** | **int**| The maximum number of matches to include on a page. | [optional] 
 **pageNumber** | **int**| The page of matches to get. | [optional] 
 **orderBy** | [**MatchesOrderByEnum**](.md)| How to order the collection of matches. | [optional] 

### Return type

[**MatchPaginated**](MatchPaginated.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MatchesMatchIdGet**
> Match apiV1MatchesMatchIdGet(matchId)

Get the match with id.

### Example
```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = MatchesApi();
final matchId = 56; // int | The id of the match to get.

try {
    final result = api_instance.apiV1MatchesMatchIdGet(matchId);
    print(result);
} catch (e) {
    print('Exception when calling MatchesApi->apiV1MatchesMatchIdGet: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **matchId** | **int**| The id of the match to get. | 

### Return type

[**Match**](Match.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **apiV1MatchesPost**
> Match apiV1MatchesPost(createMatchRequestBody)

Create a new match from a configuration.

### Example
```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = MatchesApi();
final createMatchRequestBody = CreateMatchRequestBody(); // CreateMatchRequestBody | Configuration defining the participants and rules of the match.

try {
    final result = api_instance.apiV1MatchesPost(createMatchRequestBody);
    print(result);
} catch (e) {
    print('Exception when calling MatchesApi->apiV1MatchesPost: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createMatchRequestBody** | [**CreateMatchRequestBody**](CreateMatchRequestBody.md)| Configuration defining the participants and rules of the match. | [optional] 

### Return type

[**Match**](Match.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: text/plain, application/json, text/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

