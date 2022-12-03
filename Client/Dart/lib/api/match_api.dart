//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;


class MatchApi {
  MatchApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Create a new match state
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to create a state for
  ///
  /// * [CreateMatchStateRequest] createMatchStateRequest (required):
  Future<Response> createMatchStateWithHttpInfo(int matchId, CreateMatchStateRequest createMatchStateRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/matches/{matchId}/states'
      .replaceAll('{matchId}', matchId.toString());

    // ignore: prefer_final_locals
    Object? postBody = createMatchStateRequest;

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

  /// Create a new match state
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to create a state for
  ///
  /// * [CreateMatchStateRequest] createMatchStateRequest (required):
  Future<CreateMatchState201Response?> createMatchState(int matchId, CreateMatchStateRequest createMatchStateRequest,) async {
    final response = await createMatchStateWithHttpInfo(matchId, createMatchStateRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateMatchState201Response',) as CreateMatchState201Response;
    
    }
    return null;
  }

  /// Delete latest match state
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to get
  Future<Response> deleteLatestMatchStateWithHttpInfo(int matchId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/matches/{matchId}/states/latest'
      .replaceAll('{matchId}', matchId.toString());

    // ignore: prefer_final_locals
    Object? postBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>[];


    return apiClient.invokeAPI(
      path,
      'DELETE',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Delete latest match state
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to get
  Future<void> deleteLatestMatchState(int matchId,) async {
    final response = await deleteLatestMatchStateWithHttpInfo(matchId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get latest match state
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to get
  Future<Response> getLatestMatchStateWithHttpInfo(int matchId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/matches/{matchId}/states/latest'
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

  /// Get latest match state
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to get
  Future<CreateMatchState201Response?> getLatestMatchState(int matchId,) async {
    final response = await getLatestMatchStateWithHttpInfo(matchId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateMatchState201Response',) as CreateMatchState201Response;
    
    }
    return null;
  }

  /// Get a match
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to get
  Future<Response> getMatchWithHttpInfo(int matchId,) async {
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

  /// Get a match
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to get
  Future<CreateMatch201Response?> getMatch(int matchId,) async {
    final response = await getMatchWithHttpInfo(matchId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateMatch201Response',) as CreateMatch201Response;
    
    }
    return null;
  }

  /// Get match state
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to get
  ///
  /// * [int] stateId (required):
  ///   The id of the state to get
  Future<Response> getMatchStateWithHttpInfo(int matchId, int stateId,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/matches/{matchId}/states/{stateId}'
      .replaceAll('{matchId}', matchId.toString())
      .replaceAll('{stateId}', stateId.toString());

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

  /// Get match state
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to get
  ///
  /// * [int] stateId (required):
  ///   The id of the state to get
  Future<CreateMatchState201Response?> getMatchState(int matchId, int stateId,) async {
    final response = await getMatchStateWithHttpInfo(matchId, stateId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateMatchState201Response',) as CreateMatchState201Response;
    
    }
    return null;
  }

  /// Update the latest match state
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to update the latest state of
  ///
  /// * [UpdateMatchStateRequest] updateMatchStateRequest (required):
  Future<Response> updateLatestMatchStateWithHttpInfo(int matchId, UpdateMatchStateRequest updateMatchStateRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/matches/{matchId}/states/latest'
      .replaceAll('{matchId}', matchId.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateMatchStateRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Update the latest match state
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to update the latest state of
  ///
  /// * [UpdateMatchStateRequest] updateMatchStateRequest (required):
  Future<CreateMatchState201Response?> updateLatestMatchState(int matchId, UpdateMatchStateRequest updateMatchStateRequest,) async {
    final response = await updateLatestMatchStateWithHttpInfo(matchId, updateMatchStateRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateMatchState201Response',) as CreateMatchState201Response;
    
    }
    return null;
  }

  /// Update the match state
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to update
  ///
  /// * [int] stateId (required):
  ///   The id of the state to update
  ///
  /// * [UpdateMatchStateRequest] updateMatchStateRequest (required):
  Future<Response> updateMatchStateWithHttpInfo(int matchId, int stateId, UpdateMatchStateRequest updateMatchStateRequest,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/matches/{matchId}/states/{stateId}'
      .replaceAll('{matchId}', matchId.toString())
      .replaceAll('{stateId}', stateId.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateMatchStateRequest;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json'];


    return apiClient.invokeAPI(
      path,
      'PUT',
      queryParams,
      postBody,
      headerParams,
      formParams,
      contentTypes.isEmpty ? null : contentTypes.first,
    );
  }

  /// Update the match state
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to update
  ///
  /// * [int] stateId (required):
  ///   The id of the state to update
  ///
  /// * [UpdateMatchStateRequest] updateMatchStateRequest (required):
  Future<CreateMatchState201Response?> updateMatchState(int matchId, int stateId, UpdateMatchStateRequest updateMatchStateRequest,) async {
    final response = await updateMatchStateWithHttpInfo(matchId, stateId, updateMatchStateRequest,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'CreateMatchState201Response',) as CreateMatchState201Response;
    
    }
    return null;
  }
}
