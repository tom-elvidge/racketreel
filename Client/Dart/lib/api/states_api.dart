//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

part of racketreel.matches;


class StatesApi {
  StatesApi([ApiClient? apiClient]) : apiClient = apiClient ?? defaultApiClient;

  final ApiClient apiClient;

  /// Delete the latest state from the match with id matchId.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to update the state from.
  Future<Response> apiV1MatchesMatchIdStatesLatestDeleteWithHttpInfo(int matchId,) async {
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

  /// Delete the latest state from the match with id matchId.
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to update the state from.
  Future<void> apiV1MatchesMatchIdStatesLatestDelete(int matchId,) async {
    final response = await apiV1MatchesMatchIdStatesLatestDeleteWithHttpInfo(matchId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
  }

  /// Get the latest state from the match with id matchId.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to get the latest state from.
  Future<Response> apiV1MatchesMatchIdStatesLatestGetWithHttpInfo(int matchId,) async {
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

  /// Get the latest state from the match with id matchId.
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to get the latest state from.
  Future<State?> apiV1MatchesMatchIdStatesLatestGet(int matchId,) async {
    final response = await apiV1MatchesMatchIdStatesLatestGetWithHttpInfo(matchId,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'State',) as State;
    
    }
    return null;
  }

  /// Update the latest state from the match with id matchId.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to update the state from.
  ///
  /// * [UpdateStateRequestBody] updateStateRequestBody:
  ///   
  Future<Response> apiV1MatchesMatchIdStatesLatestPutWithHttpInfo(int matchId, { UpdateStateRequestBody? updateStateRequestBody, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/matches/{matchId}/states/latest'
      .replaceAll('{matchId}', matchId.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateStateRequestBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/json-patch+json', 'text/json', 'application/*+json'];


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

  /// Update the latest state from the match with id matchId.
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to update the state from.
  ///
  /// * [UpdateStateRequestBody] updateStateRequestBody:
  ///   
  Future<State?> apiV1MatchesMatchIdStatesLatestPut(int matchId, { UpdateStateRequestBody? updateStateRequestBody, }) async {
    final response = await apiV1MatchesMatchIdStatesLatestPutWithHttpInfo(matchId,  updateStateRequestBody: updateStateRequestBody, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'State',) as State;
    
    }
    return null;
  }

  /// Create a new match state when a participant scores a point.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to create a state for.
  ///
  /// * [CreateStateRequestBody] createStateRequestBody:
  ///   The request body which should specify the participant which scored the point.
  Future<Response> apiV1MatchesMatchIdStatesPostWithHttpInfo(int matchId, { CreateStateRequestBody? createStateRequestBody, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/matches/{matchId}/states'
      .replaceAll('{matchId}', matchId.toString());

    // ignore: prefer_final_locals
    Object? postBody = createStateRequestBody;

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

  /// Create a new match state when a participant scores a point.
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to create a state for.
  ///
  /// * [CreateStateRequestBody] createStateRequestBody:
  ///   The request body which should specify the participant which scored the point.
  Future<State?> apiV1MatchesMatchIdStatesPost(int matchId, { CreateStateRequestBody? createStateRequestBody, }) async {
    final response = await apiV1MatchesMatchIdStatesPostWithHttpInfo(matchId,  createStateRequestBody: createStateRequestBody, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'State',) as State;
    
    }
    return null;
  }

  /// Get the state with index stateIndex from the match with id matchId.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to get the state from.
  ///
  /// * [int] stateIndex (required):
  ///   The index of state in the match to get.
  Future<Response> apiV1MatchesMatchIdStatesStateIndexGetWithHttpInfo(int matchId, int stateIndex,) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/matches/{matchId}/states/{stateIndex}'
      .replaceAll('{matchId}', matchId.toString())
      .replaceAll('{stateIndex}', stateIndex.toString());

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

  /// Get the state with index stateIndex from the match with id matchId.
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to get the state from.
  ///
  /// * [int] stateIndex (required):
  ///   The index of state in the match to get.
  Future<State?> apiV1MatchesMatchIdStatesStateIndexGet(int matchId, int stateIndex,) async {
    final response = await apiV1MatchesMatchIdStatesStateIndexGetWithHttpInfo(matchId, stateIndex,);
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'State',) as State;
    
    }
    return null;
  }

  /// Update the state with index stateIndex from the match with id matchId.
  ///
  /// Note: This method returns the HTTP [Response].
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to update the state from.
  ///
  /// * [int] stateIndex (required):
  ///   The index of state in the match to update.
  ///
  /// * [UpdateStateRequestBody] updateStateRequestBody:
  ///   
  Future<Response> apiV1MatchesMatchIdStatesStateIndexPutWithHttpInfo(int matchId, int stateIndex, { UpdateStateRequestBody? updateStateRequestBody, }) async {
    // ignore: prefer_const_declarations
    final path = r'/api/v1/matches/{matchId}/states/{stateIndex}'
      .replaceAll('{matchId}', matchId.toString())
      .replaceAll('{stateIndex}', stateIndex.toString());

    // ignore: prefer_final_locals
    Object? postBody = updateStateRequestBody;

    final queryParams = <QueryParam>[];
    final headerParams = <String, String>{};
    final formParams = <String, String>{};

    const contentTypes = <String>['application/json', 'application/json-patch+json', 'text/json', 'application/*+json'];


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

  /// Update the state with index stateIndex from the match with id matchId.
  ///
  /// Parameters:
  ///
  /// * [int] matchId (required):
  ///   The id of the match to update the state from.
  ///
  /// * [int] stateIndex (required):
  ///   The index of state in the match to update.
  ///
  /// * [UpdateStateRequestBody] updateStateRequestBody:
  ///   
  Future<State?> apiV1MatchesMatchIdStatesStateIndexPut(int matchId, int stateIndex, { UpdateStateRequestBody? updateStateRequestBody, }) async {
    final response = await apiV1MatchesMatchIdStatesStateIndexPutWithHttpInfo(matchId, stateIndex,  updateStateRequestBody: updateStateRequestBody, );
    if (response.statusCode >= HttpStatus.badRequest) {
      throw ApiException(response.statusCode, await _decodeBodyBytes(response));
    }
    // When a remote server returns no body with a status of 204, we shall not decode it.
    // At the time of writing this, `dart:convert` will throw an "Unexpected end of input"
    // FormatException when trying to decode an empty string.
    if (response.body.isNotEmpty && response.statusCode != HttpStatus.noContent) {
      return await apiClient.deserializeAsync(await _decodeBodyBytes(response), 'State',) as State;
    
    }
    return null;
  }
}
