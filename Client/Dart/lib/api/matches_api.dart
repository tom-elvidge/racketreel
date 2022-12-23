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
  MatchesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Get a page of matches from the collection of all ordered matches.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] pageSize:
  ///   The maximum number of matches to include on a page.
  ///
  /// * [int] pageNumber:
  ///   The page of matches to get.
  ///
  /// * [MatchesOrderByEnum] orderBy:
  ///   How to order the collection of matches.
  Future<Response> apiV1MatchesGetWithHttpInfo({ int? pageSize, int? pageNumber, MatchesOrderByEnum? orderBy, }) async {
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
    if (orderBy != null) {
      queryParams.addAll(_queryParams('', 'orderBy', orderBy));
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

  /// Get a page of matches from the collection of all ordered matches.
  ///
  /// Parameters:
  ///
  /// * [int] pageSize:
  ///   The maximum number of matches to include on a page.
  ///
  /// * [int] pageNumber:
  ///   The page of matches to get.
  ///
  /// * [MatchesOrderByEnum] orderBy:
  ///   How to order the collection of matches.
  Future<MatchPaginated?> apiV1MatchesGet({ int? pageSize, int? pageNumber, MatchesOrderByEnum? orderBy, }) async {
    final response = await apiV1MatchesGetWithHttpInfo( pageSize: pageSize, pageNumber: pageNumber, orderBy: orderBy, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'MatchPaginated',) as MatchPaginated;
    
    }
    return null;
  }

  /// Get the match with id.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to get.
  Future<Response> apiV1MatchesMatchIdGetWithHttpInfo(int matchId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/matches/{matchId}'
      .replaceAll('{matchId}', matchId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

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

  /// Get the match with id.
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to get.
  Future<Match?> apiV1MatchesMatchIdGet(int matchId,) async {
    final response = await apiV1MatchesMatchIdGetWithHttpInfo(matchId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Match',) as Match;
    
    }
    return null;
  }

  /// Create a new match from a configuration.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [CreateMatchRequestBody] createMatchRequestBody:
  ///   Configuration defining the participants and rules of the match.
  Future<Response> apiV1MatchesPostWithHttpInfo({ CreateMatchRequestBody? createMatchRequestBody, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/matches';

    // ignore: prefer_final_locals
    Object? postBody = createMatchRequestBody;

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

  /// Create a new match from a configuration.
  ///
  /// Parameters:
  ///
  /// * [CreateMatchRequestBody] createMatchRequestBody:
  ///   Configuration defining the participants and rules of the match.
  Future<Match?> apiV1MatchesPost({ CreateMatchRequestBody? createMatchRequestBody, }) async {
    final response = await apiV1MatchesPostWithHttpInfo( createMatchRequestBody: createMatchRequestBody, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'Match',) as Match;
    
    }
    return null;
  }
}
