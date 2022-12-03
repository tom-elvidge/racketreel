//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;

class MatchesApi {
  MatchesApi([ApiClient? apiClient])
      : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a new match
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateMatchRequest] createMatchRequest (required):
  Future<Response> createMatchWithHttpInfo(
    CreateMatchRequest createMatchRequest,
  ) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/matches';

    // ignore: prefer_final_locals
    Object? postBody = createMatchRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];

    return apiClient.invokeAPI(
      path,
      'POST',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Create a new match
  ///
  /// Parameters:
  ///
  /// * [CreateMatchRequest] createMatchRequest (required):
  Future<CreateMatch201Response?> createMatch(
    CreateMatchRequest createMatchRequest,
  ) async {
    final response = await createMatchWithHttpInfo(
      createMatchRequest,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'CreateMatch201Response',
      ) as CreateMatch201Response;
    }
    return null;
  }

  /// List all matches
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] pageSize:
  ///   How many items to return per page
  ///
  /// * [int] pageNumber:
  ///   Which page to return
  ///
  /// * [Bool] complete:
  ///   Filter matches based on if they are complete
  Future<Response> listMatchesWithHttpInfo({
    int? pageSize,
    int? pageNumber,
    bool? complete,
  }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/matches';

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    if (pageSize != null) {
      queryParams.addAll(_queryParams('', 'pageSize', pageSize));
    }
    if (pageNumber != null) {
      queryParams.addAll(_queryParams('', 'pageNumber', pageNumber));
    }
    if (complete != null) {
      queryParams.addAll(_queryParams('', 'complete', complete));
    }

    const contentTypes = <String>[];

    return apiClient.invokeAPI(
      path,
      'GET',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// List all matches
  ///
  /// Parameters:
  ///
  /// * [int] pageSize:
  ///   How many items to return per page
  ///
  /// * [int] pageNumber:
  ///   Which page to return
  ///
  /// * [Bool] complete:
  ///   Filter matches based on if they are complete
  Future<ListMatches200Response?> listMatches({
    int? pageSize,
    int? pageNumber,
    bool? complete,
  }) async {
    final response = await listMatchesWithHttpInfo(
      pageSize: pageSize,
      pageNumber: pageNumber,
      complete: complete,
    );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty &&
        response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(
        await _decodeBodyBytes(response),
        'ListMatches200Response',
      ) as ListMatches200Response;
    }
    return null;
  }
}
