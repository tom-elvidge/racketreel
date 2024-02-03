//
//  Generated code. Do not modify.
//  source: matches.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
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

class ConfigureError extends $pb.ProtobufEnum {
  static const ConfigureError CONFIGURE_ERROR_UNKNOWN = ConfigureError._(0, _omitEnumNames ? '' : 'CONFIGURE_ERROR_UNKNOWN');

  static const $core.List<ConfigureError> values = <ConfigureError> [
    CONFIGURE_ERROR_UNKNOWN,
  ];

  static final $core.Map<$core.int, ConfigureError> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ConfigureError? valueOf($core.int value) => _byValue[value];

  const ConfigureError._($core.int v, $core.String n) : super(v, n);
}

class AddPointError extends $pb.ProtobufEnum {
  static const AddPointError ADD_POINT_UNKNOWN = AddPointError._(0, _omitEnumNames ? '' : 'ADD_POINT_UNKNOWN');
  static const AddPointError ADD_POINT_DOES_NOT_EXIST = AddPointError._(1, _omitEnumNames ? '' : 'ADD_POINT_DOES_NOT_EXIST');
  static const AddPointError ADD_POINT_IS_COMPLETE = AddPointError._(2, _omitEnumNames ? '' : 'ADD_POINT_IS_COMPLETE');
  static const AddPointError ADD_POINT_UNAUTHORIZED = AddPointError._(3, _omitEnumNames ? '' : 'ADD_POINT_UNAUTHORIZED');

  static const $core.List<AddPointError> values = <AddPointError> [
    ADD_POINT_UNKNOWN,
    ADD_POINT_DOES_NOT_EXIST,
    ADD_POINT_IS_COMPLETE,
    ADD_POINT_UNAUTHORIZED,
  ];

  static final $core.Map<$core.int, AddPointError> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AddPointError? valueOf($core.int value) => _byValue[value];

  const AddPointError._($core.int v, $core.String n) : super(v, n);
}

class UndoPointError extends $pb.ProtobufEnum {
  static const UndoPointError UNDO_POINT_UNKNOWN = UndoPointError._(0, _omitEnumNames ? '' : 'UNDO_POINT_UNKNOWN');
  static const UndoPointError UNDO_POINT_NOTHING_TO_UNDO = UndoPointError._(1, _omitEnumNames ? '' : 'UNDO_POINT_NOTHING_TO_UNDO');
  static const UndoPointError UNDO_POINT_UNAUTHORIZED = UndoPointError._(2, _omitEnumNames ? '' : 'UNDO_POINT_UNAUTHORIZED');

  static const $core.List<UndoPointError> values = <UndoPointError> [
    UNDO_POINT_UNKNOWN,
    UNDO_POINT_NOTHING_TO_UNDO,
    UNDO_POINT_UNAUTHORIZED,
  ];

  static final $core.Map<$core.int, UndoPointError> _byValue = $pb.ProtobufEnum.initByValue(values);
  static UndoPointError? valueOf($core.int value) => _byValue[value];

  const UndoPointError._($core.int v, $core.String n) : super(v, n);
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

class ToggleHighlightError extends $pb.ProtobufEnum {
  static const ToggleHighlightError TOGGLE_HIGHLIGHT_UNKNOWN = ToggleHighlightError._(0, _omitEnumNames ? '' : 'TOGGLE_HIGHLIGHT_UNKNOWN');
  static const ToggleHighlightError TOGGLE_HIGHLIGHT_STATE_DOES_NOT_EXIST = ToggleHighlightError._(1, _omitEnumNames ? '' : 'TOGGLE_HIGHLIGHT_STATE_DOES_NOT_EXIST');
  static const ToggleHighlightError TOGGLE_HIGHLIGHT_UNAUTHORIZED = ToggleHighlightError._(2, _omitEnumNames ? '' : 'TOGGLE_HIGHLIGHT_UNAUTHORIZED');

  static const $core.List<ToggleHighlightError> values = <ToggleHighlightError> [
    TOGGLE_HIGHLIGHT_UNKNOWN,
    TOGGLE_HIGHLIGHT_STATE_DOES_NOT_EXIST,
    TOGGLE_HIGHLIGHT_UNAUTHORIZED,
  ];

  static final $core.Map<$core.int, ToggleHighlightError> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ToggleHighlightError? valueOf($core.int value) => _byValue[value];

  const ToggleHighlightError._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
