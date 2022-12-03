# racket_reel_matches.api.MatchesApi

## Load the API package
```dart
import 'package:racket_reel_matches/api.dart';
```

All URIs are relative to *http://localhost:8080*

Method | HTTP request | Description
------------- | ------------- | -------------
[**createMatch**](MatchesApi.md#creatematch) | **POST** /api/v1/matches | Create a new match
[**listMatches**](MatchesApi.md#listmatches) | **GET** /api/v1/matches | List all matches


# **createMatch**
> CreateMatch201Response createMatch(createMatchRequest)

Create a new match

### Example
```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = MatchesApi();
final createMatchRequest = CreateMatchRequest(); // CreateMatchRequest | 

try {
    final result = api_instance.createMatch(createMatchRequest);
    print(result);
} catch (e) {
    print('Exception when calling MatchesApi->createMatch: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **createMatchRequest** | [**CreateMatchRequest**](CreateMatchRequest.md)|  | 

### Return type

[**CreateMatch201Response**](CreateMatch201Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: application/json
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

# **listMatches**
> ListMatches200Response listMatches(pageSize, pageNumber, complete)

List all matches

### Example
```dart
import 'package:racket_reel_matches/api.dart';

final api_instance = MatchesApi();
final pageSize = 56; // int | How many items to return per page
final pageNumber = 56; // int | Which page to return
final complete = ; // Bool | Filter matches based on if they are complete

try {
    final result = api_instance.listMatches(pageSize, pageNumber, complete);
    print(result);
} catch (e) {
    print('Exception when calling MatchesApi->listMatches: $e\n');
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **pageSize** | **int**| How many items to return per page | [optional] 
 **pageNumber** | **int**| Which page to return | [optional] 
 **complete** | [**Bool**](.md)| Filter matches based on if they are complete | [optional] 

### Return type

[**ListMatches200Response**](ListMatches200Response.md)

### Authorization

No authorization required

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

