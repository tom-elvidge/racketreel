//
//  Generated code. Do not modify.
//  source: matches.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Format extends $pb.ProtobufEnum {
  static const Format BEST_OF_ONE = Format._(0, _omitEnumNames ? '' : 'BEST_OF_ONE');
  static const Format TIEBREAK_TO_TEN = Format._(1, _omitEnumNames ? '' : 'TIEBREAK_TO_TEN');
  static const Format BEST_OF_THREE = Format._(2, _omitEnumNames ? '' : 'BEST_OF_THREE');
  static const Format BEST_OF_THREE_FST = Format._(3, _omitEnumNames ? '' : 'BEST_OF_THREE_FST');
  static const Format BEST_OF_FIVE = Format._(4, _omitEnumNames ? '' : 'BEST_OF_FIVE');
  static const Format BEST_OF_FIVE_FST = Format._(5, _omitEnumNames ? '' : 'BEST_OF_FIVE_FST');
  static const Format FAST4 = Format._(6, _omitEnumNames ? '' : 'FAST4');

  static const $core.List<Format> values = <Format> [
    BEST_OF_ONE,
    TIEBREAK_TO_TEN,
    BEST_OF_THREE,
    BEST_OF_THREE_FST,
    BEST_OF_FIVE,
    BEST_OF_FIVE_FST,
    FAST4,
  ];

  static final $core.Map<$core.int, Format> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Format? valueOf($core.int value) => _byValue[value];

  const Format._($core.int v, $core.String n) : super(v, n);
}

class Team extends $pb.ProtobufEnum {
  static const Team TEAM_ONE = Team._(0, _omitEnumNames ? '' : 'TEAM_ONE');
  static const Team TEAM_TWO = Team._(1, _omitEnumNames ? '' : 'TEAM_TWO');

  static const $core.List<Team> values = <Team> [
    TEAM_ONE,
    TEAM_TWO,
  ];

  static final $core.Map<$core.int, Team> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Team? valueOf($core.int value) => _byValue[value];

  const Team._($core.int v, $core.String n) : super(v, n);
}

class PlayerCount extends $pb.ProtobufEnum {
  static const PlayerCount SINGLES = PlayerCount._(0, _omitEnumNames ? '' : 'SINGLES');
  static const PlayerCount DOUBLES = PlayerCount._(1, _omitEnumNames ? '' : 'DOUBLES');

  static const $core.List<PlayerCount> values = <PlayerCount> [
    SINGLES,
    DOUBLES,
  ];

  static final $core.Map<$core.int, PlayerCount> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PlayerCount? valueOf($core.int value) => _byValue[value];

  const PlayerCount._($core.int v, $core.String n) : super(v, n);
}

class ConfigureError extends $pb.ProtobufEnum {
  static const ConfigureError MISSING_PLAYER_TWO_NAMES = ConfigureError._(0, _omitEnumNames ? '' : 'MISSING_PLAYER_TWO_NAMES');

  static const $core.List<ConfigureError> values = <ConfigureError> [
    MISSING_PLAYER_TWO_NAMES,
  ];

  static final $core.Map<$core.int, ConfigureError> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ConfigureError? valueOf($core.int value) => _byValue[value];

  const ConfigureError._($core.int v, $core.String n) : super(v, n);
}

class PointError extends $pb.ProtobufEnum {
  static const PointError POINT_UNKNOWN = PointError._(0, _omitEnumNames ? '' : 'POINT_UNKNOWN');
  static const PointError POINT_DOES_NOT_EXIST = PointError._(1, _omitEnumNames ? '' : 'POINT_DOES_NOT_EXIST');
  static const PointError POINT_PLAYERS_NOT_SET = PointError._(2, _omitEnumNames ? '' : 'POINT_PLAYERS_NOT_SET');
  static const PointError POINT_IS_COMPLETE = PointError._(3, _omitEnumNames ? '' : 'POINT_IS_COMPLETE');
  static const PointError POINT_NOTHING_TO_UNDO = PointError._(4, _omitEnumNames ? '' : 'POINT_NOTHING_TO_UNDO');

  static const $core.List<PointError> values = <PointError> [
    POINT_UNKNOWN,
    POINT_DOES_NOT_EXIST,
    POINT_PLAYERS_NOT_SET,
    POINT_IS_COMPLETE,
    POINT_NOTHING_TO_UNDO,
  ];

  static final $core.Map<$core.int, PointError> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PointError? valueOf($core.int value) => _byValue[value];

  const PointError._($core.int v, $core.String n) : super(v, n);
}

class GetSummaryError extends $pb.ProtobufEnum {
  static const GetSummaryError GET_SUMMARY_MATCH_DOES_NOT_EXIST = GetSummaryError._(0, _omitEnumNames ? '' : 'GET_SUMMARY_MATCH_DOES_NOT_EXIST');
  static const GetSummaryError GET_SUMMARY_UNKNOWN = GetSummaryError._(1, _omitEnumNames ? '' : 'GET_SUMMARY_UNKNOWN');

  static const $core.List<GetSummaryError> values = <GetSummaryError> [
    GET_SUMMARY_MATCH_DOES_NOT_EXIST,
    GET_SUMMARY_UNKNOWN,
  ];

  static final $core.Map<$core.int, GetSummaryError> _byValue = $pb.ProtobufEnum.initByValue(values);
  static GetSummaryError? valueOf($core.int value) => _byValue[value];

  const GetSummaryError._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
