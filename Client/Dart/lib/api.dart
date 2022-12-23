//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//
// @dart=2.12

// ignore_for_file: unused_element, unused_import
// ignore_for_file: always_put_required_named_parameters_first
// ignore_for_file: constant_identifier_names
// ignore_for_file: lines_longer_than_80_chars

library racketreel.matches;

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'api_client.dart';
part 'api_helper.dart';
part 'api_exception.dart';
part 'auth/authentication.dart';
part 'auth/api_key_auth.dart';
part 'auth/oauth.dart';
part 'auth/http_basic_auth.dart';
part 'auth/http_bearer_auth.dart';

part 'api/matches_api.dart';
part 'api/states_api.dart';

part 'model/create_match_request_body.dart';
part 'model/create_state_request_body.dart';
part 'model/match.dart';
part 'model/match_format_enum.dart';
part 'model/match_paginated.dart';
part 'model/match_summary.dart';
part 'model/matches_order_by_enum.dart';
part 'model/participant_score.dart';
part 'model/participant_set_summary.dart';
part 'model/problem_details.dart';
part 'model/set_summary.dart';
part 'model/state.dart';
part 'model/update_state_request_body.dart';


const _delimiters = {'csv': ',', 'ssv': ' ', 'tsv': '\t', 'pipes': '|'};
const _dateEpochMarker = 'epoch';
final _dateFormatter = DateFormat('yyyy-MM-dd');
final _regList = RegExp(r'^List<(.*)>$');
final _regSet = RegExp(r'^Set<(.*)>$');
final _regMap = RegExp(r'^Map<String,(.*)>$');

ApiClient defaultApiClient = ApiClient();
