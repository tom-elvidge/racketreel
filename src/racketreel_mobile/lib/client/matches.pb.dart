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

import 'google/protobuf/duration.pb.dart' as $2;
import 'google/protobuf/timestamp.pb.dart' as $1;
import 'matches.pbenum.dart';

export 'matches.pbenum.dart';

class ConfigureRequest extends $pb.GeneratedMessage {
  factory ConfigureRequest({
    Format? format,
    Team? servingFirst,
    $core.String? teamOneName,
    $core.String? teamTwoName,
  }) {
    final $result = create();
    if (format != null) {
      $result.format = format;
    }
    if (servingFirst != null) {
      $result.servingFirst = servingFirst;
    }
    if (teamOneName != null) {
      $result.teamOneName = teamOneName;
    }
    if (teamTwoName != null) {
      $result.teamTwoName = teamTwoName;
    }
    return $result;
  }
  ConfigureRequest._() : super();
  factory ConfigureRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigureRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigureRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..e<Format>(1, _omitFieldNames ? '' : 'format', $pb.PbFieldType.OE, defaultOrMaker: Format.BEST_OF_ONE, valueOf: Format.valueOf, enumValues: Format.values)
    ..e<Team>(2, _omitFieldNames ? '' : 'servingFirst', $pb.PbFieldType.OE, defaultOrMaker: Team.TEAM_ONE, valueOf: Team.valueOf, enumValues: Team.values)
    ..aOS(4, _omitFieldNames ? '' : 'teamOneName')
    ..aOS(6, _omitFieldNames ? '' : 'teamTwoName')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigureRequest clone() => ConfigureRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigureRequest copyWith(void Function(ConfigureRequest) updates) => super.copyWith((message) => updates(message as ConfigureRequest)) as ConfigureRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigureRequest create() => ConfigureRequest._();
  ConfigureRequest createEmptyInstance() => create();
  static $pb.PbList<ConfigureRequest> createRepeated() => $pb.PbList<ConfigureRequest>();
  @$core.pragma('dart2js:noInline')
  static ConfigureRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigureRequest>(create);
  static ConfigureRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Format get format => $_getN(0);
  @$pb.TagNumber(1)
  set format(Format v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasFormat() => $_has(0);
  @$pb.TagNumber(1)
  void clearFormat() => clearField(1);

  @$pb.TagNumber(2)
  Team get servingFirst => $_getN(1);
  @$pb.TagNumber(2)
  set servingFirst(Team v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasServingFirst() => $_has(1);
  @$pb.TagNumber(2)
  void clearServingFirst() => clearField(2);

  @$pb.TagNumber(4)
  $core.String get teamOneName => $_getSZ(2);
  @$pb.TagNumber(4)
  set teamOneName($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(4)
  $core.bool hasTeamOneName() => $_has(2);
  @$pb.TagNumber(4)
  void clearTeamOneName() => clearField(4);

  @$pb.TagNumber(6)
  $core.String get teamTwoName => $_getSZ(3);
  @$pb.TagNumber(6)
  set teamTwoName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(6)
  $core.bool hasTeamTwoName() => $_has(3);
  @$pb.TagNumber(6)
  void clearTeamTwoName() => clearField(6);
}

class ConfigureReply extends $pb.GeneratedMessage {
  factory ConfigureReply({
    $core.bool? success,
    ConfigureError? error,
    $core.int? matchId,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (error != null) {
      $result.error = error;
    }
    if (matchId != null) {
      $result.matchId = matchId;
    }
    return $result;
  }
  ConfigureReply._() : super();
  factory ConfigureReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigureReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigureReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..e<ConfigureError>(2, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE, defaultOrMaker: ConfigureError.CONFIGURE_ERROR_UNKNOWN, valueOf: ConfigureError.valueOf, enumValues: ConfigureError.values)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'matchId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ConfigureReply clone() => ConfigureReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ConfigureReply copyWith(void Function(ConfigureReply) updates) => super.copyWith((message) => updates(message as ConfigureReply)) as ConfigureReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConfigureReply create() => ConfigureReply._();
  ConfigureReply createEmptyInstance() => create();
  static $pb.PbList<ConfigureReply> createRepeated() => $pb.PbList<ConfigureReply>();
  @$core.pragma('dart2js:noInline')
  static ConfigureReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ConfigureReply>(create);
  static ConfigureReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  ConfigureError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error(ConfigureError v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get matchId => $_getIZ(2);
  @$pb.TagNumber(3)
  set matchId($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMatchId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMatchId() => clearField(3);
}

class AddPointRequest extends $pb.GeneratedMessage {
  factory AddPointRequest({
    $core.int? matchId,
    Team? team,
  }) {
    final $result = create();
    if (matchId != null) {
      $result.matchId = matchId;
    }
    if (team != null) {
      $result.team = team;
    }
    return $result;
  }
  AddPointRequest._() : super();
  factory AddPointRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddPointRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddPointRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'matchId', $pb.PbFieldType.O3)
    ..e<Team>(2, _omitFieldNames ? '' : 'team', $pb.PbFieldType.OE, defaultOrMaker: Team.TEAM_ONE, valueOf: Team.valueOf, enumValues: Team.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddPointRequest clone() => AddPointRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddPointRequest copyWith(void Function(AddPointRequest) updates) => super.copyWith((message) => updates(message as AddPointRequest)) as AddPointRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddPointRequest create() => AddPointRequest._();
  AddPointRequest createEmptyInstance() => create();
  static $pb.PbList<AddPointRequest> createRepeated() => $pb.PbList<AddPointRequest>();
  @$core.pragma('dart2js:noInline')
  static AddPointRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddPointRequest>(create);
  static AddPointRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get matchId => $_getIZ(0);
  @$pb.TagNumber(1)
  set matchId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMatchId() => clearField(1);

  @$pb.TagNumber(2)
  Team get team => $_getN(1);
  @$pb.TagNumber(2)
  set team(Team v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasTeam() => $_has(1);
  @$pb.TagNumber(2)
  void clearTeam() => clearField(2);
}

class AddPointReply extends $pb.GeneratedMessage {
  factory AddPointReply({
    $core.bool? success,
    AddPointError? error,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (error != null) {
      $result.error = error;
    }
    return $result;
  }
  AddPointReply._() : super();
  factory AddPointReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddPointReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddPointReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..e<AddPointError>(2, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE, defaultOrMaker: AddPointError.ADD_POINT_UNKNOWN, valueOf: AddPointError.valueOf, enumValues: AddPointError.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddPointReply clone() => AddPointReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddPointReply copyWith(void Function(AddPointReply) updates) => super.copyWith((message) => updates(message as AddPointReply)) as AddPointReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddPointReply create() => AddPointReply._();
  AddPointReply createEmptyInstance() => create();
  static $pb.PbList<AddPointReply> createRepeated() => $pb.PbList<AddPointReply>();
  @$core.pragma('dart2js:noInline')
  static AddPointReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddPointReply>(create);
  static AddPointReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  AddPointError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error(AddPointError v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
}

class UndoPointRequest extends $pb.GeneratedMessage {
  factory UndoPointRequest({
    $core.int? matchId,
  }) {
    final $result = create();
    if (matchId != null) {
      $result.matchId = matchId;
    }
    return $result;
  }
  UndoPointRequest._() : super();
  factory UndoPointRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UndoPointRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UndoPointRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'matchId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UndoPointRequest clone() => UndoPointRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UndoPointRequest copyWith(void Function(UndoPointRequest) updates) => super.copyWith((message) => updates(message as UndoPointRequest)) as UndoPointRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UndoPointRequest create() => UndoPointRequest._();
  UndoPointRequest createEmptyInstance() => create();
  static $pb.PbList<UndoPointRequest> createRepeated() => $pb.PbList<UndoPointRequest>();
  @$core.pragma('dart2js:noInline')
  static UndoPointRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UndoPointRequest>(create);
  static UndoPointRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get matchId => $_getIZ(0);
  @$pb.TagNumber(1)
  set matchId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMatchId() => clearField(1);
}

class UndoPointReply extends $pb.GeneratedMessage {
  factory UndoPointReply({
    $core.bool? success,
    UndoPointError? error,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (error != null) {
      $result.error = error;
    }
    return $result;
  }
  UndoPointReply._() : super();
  factory UndoPointReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UndoPointReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UndoPointReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..e<UndoPointError>(2, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE, defaultOrMaker: UndoPointError.UNDO_POINT_UNKNOWN, valueOf: UndoPointError.valueOf, enumValues: UndoPointError.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UndoPointReply clone() => UndoPointReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UndoPointReply copyWith(void Function(UndoPointReply) updates) => super.copyWith((message) => updates(message as UndoPointReply)) as UndoPointReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UndoPointReply create() => UndoPointReply._();
  UndoPointReply createEmptyInstance() => create();
  static $pb.PbList<UndoPointReply> createRepeated() => $pb.PbList<UndoPointReply>();
  @$core.pragma('dart2js:noInline')
  static UndoPointReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UndoPointReply>(create);
  static UndoPointReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  UndoPointError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error(UndoPointError v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
}

class GetSummaryRequest extends $pb.GeneratedMessage {
  factory GetSummaryRequest({
    $core.int? matchId,
  }) {
    final $result = create();
    if (matchId != null) {
      $result.matchId = matchId;
    }
    return $result;
  }
  GetSummaryRequest._() : super();
  factory GetSummaryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSummaryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSummaryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'matchId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSummaryRequest clone() => GetSummaryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSummaryRequest copyWith(void Function(GetSummaryRequest) updates) => super.copyWith((message) => updates(message as GetSummaryRequest)) as GetSummaryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSummaryRequest create() => GetSummaryRequest._();
  GetSummaryRequest createEmptyInstance() => create();
  static $pb.PbList<GetSummaryRequest> createRepeated() => $pb.PbList<GetSummaryRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSummaryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSummaryRequest>(create);
  static GetSummaryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get matchId => $_getIZ(0);
  @$pb.TagNumber(1)
  set matchId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMatchId() => clearField(1);
}

class GetSummaryReply extends $pb.GeneratedMessage {
  factory GetSummaryReply({
    $core.bool? success,
    GetSummaryError? error,
    Summary? summary,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (error != null) {
      $result.error = error;
    }
    if (summary != null) {
      $result.summary = summary;
    }
    return $result;
  }
  GetSummaryReply._() : super();
  factory GetSummaryReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSummaryReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSummaryReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..e<GetSummaryError>(2, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE, defaultOrMaker: GetSummaryError.GET_SUMMARY_MATCH_DOES_NOT_EXIST, valueOf: GetSummaryError.valueOf, enumValues: GetSummaryError.values)
    ..aOM<Summary>(3, _omitFieldNames ? '' : 'summary', subBuilder: Summary.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSummaryReply clone() => GetSummaryReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSummaryReply copyWith(void Function(GetSummaryReply) updates) => super.copyWith((message) => updates(message as GetSummaryReply)) as GetSummaryReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSummaryReply create() => GetSummaryReply._();
  GetSummaryReply createEmptyInstance() => create();
  static $pb.PbList<GetSummaryReply> createRepeated() => $pb.PbList<GetSummaryReply>();
  @$core.pragma('dart2js:noInline')
  static GetSummaryReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSummaryReply>(create);
  static GetSummaryReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  GetSummaryError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error(GetSummaryError v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(3)
  Summary get summary => $_getN(2);
  @$pb.TagNumber(3)
  set summary(Summary v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasSummary() => $_has(2);
  @$pb.TagNumber(3)
  void clearSummary() => clearField(3);
  @$pb.TagNumber(3)
  Summary ensureSummary() => $_ensure(2);
}

class GetSummaryV2Reply extends $pb.GeneratedMessage {
  factory GetSummaryV2Reply({
    $core.bool? success,
    GetSummaryError? error,
    SummaryV2? summary,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (error != null) {
      $result.error = error;
    }
    if (summary != null) {
      $result.summary = summary;
    }
    return $result;
  }
  GetSummaryV2Reply._() : super();
  factory GetSummaryV2Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSummaryV2Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSummaryV2Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..e<GetSummaryError>(2, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE, defaultOrMaker: GetSummaryError.GET_SUMMARY_MATCH_DOES_NOT_EXIST, valueOf: GetSummaryError.valueOf, enumValues: GetSummaryError.values)
    ..aOM<SummaryV2>(4, _omitFieldNames ? '' : 'summary', subBuilder: SummaryV2.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSummaryV2Reply clone() => GetSummaryV2Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSummaryV2Reply copyWith(void Function(GetSummaryV2Reply) updates) => super.copyWith((message) => updates(message as GetSummaryV2Reply)) as GetSummaryV2Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSummaryV2Reply create() => GetSummaryV2Reply._();
  GetSummaryV2Reply createEmptyInstance() => create();
  static $pb.PbList<GetSummaryV2Reply> createRepeated() => $pb.PbList<GetSummaryV2Reply>();
  @$core.pragma('dart2js:noInline')
  static GetSummaryV2Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSummaryV2Reply>(create);
  static GetSummaryV2Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  GetSummaryError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error(GetSummaryError v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);

  @$pb.TagNumber(4)
  SummaryV2 get summary => $_getN(2);
  @$pb.TagNumber(4)
  set summary(SummaryV2 v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasSummary() => $_has(2);
  @$pb.TagNumber(4)
  void clearSummary() => clearField(4);
  @$pb.TagNumber(4)
  SummaryV2 ensureSummary() => $_ensure(2);
}

class ToggleHighlightRequest extends $pb.GeneratedMessage {
  factory ToggleHighlightRequest({
    $core.int? matchId,
    $core.int? version,
  }) {
    final $result = create();
    if (matchId != null) {
      $result.matchId = matchId;
    }
    if (version != null) {
      $result.version = version;
    }
    return $result;
  }
  ToggleHighlightRequest._() : super();
  factory ToggleHighlightRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ToggleHighlightRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ToggleHighlightRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'matchId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ToggleHighlightRequest clone() => ToggleHighlightRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ToggleHighlightRequest copyWith(void Function(ToggleHighlightRequest) updates) => super.copyWith((message) => updates(message as ToggleHighlightRequest)) as ToggleHighlightRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ToggleHighlightRequest create() => ToggleHighlightRequest._();
  ToggleHighlightRequest createEmptyInstance() => create();
  static $pb.PbList<ToggleHighlightRequest> createRepeated() => $pb.PbList<ToggleHighlightRequest>();
  @$core.pragma('dart2js:noInline')
  static ToggleHighlightRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ToggleHighlightRequest>(create);
  static ToggleHighlightRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get matchId => $_getIZ(0);
  @$pb.TagNumber(1)
  set matchId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMatchId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get version => $_getIZ(1);
  @$pb.TagNumber(2)
  set version($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);
}

class ToggleHighlightReply extends $pb.GeneratedMessage {
  factory ToggleHighlightReply({
    $core.bool? success,
    ToggleHighlightError? error,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (error != null) {
      $result.error = error;
    }
    return $result;
  }
  ToggleHighlightReply._() : super();
  factory ToggleHighlightReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ToggleHighlightReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ToggleHighlightReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..e<ToggleHighlightError>(2, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE, defaultOrMaker: ToggleHighlightError.TOGGLE_HIGHLIGHT_UNKNOWN, valueOf: ToggleHighlightError.valueOf, enumValues: ToggleHighlightError.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ToggleHighlightReply clone() => ToggleHighlightReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ToggleHighlightReply copyWith(void Function(ToggleHighlightReply) updates) => super.copyWith((message) => updates(message as ToggleHighlightReply)) as ToggleHighlightReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ToggleHighlightReply create() => ToggleHighlightReply._();
  ToggleHighlightReply createEmptyInstance() => create();
  static $pb.PbList<ToggleHighlightReply> createRepeated() => $pb.PbList<ToggleHighlightReply>();
  @$core.pragma('dart2js:noInline')
  static ToggleHighlightReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ToggleHighlightReply>(create);
  static ToggleHighlightReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  ToggleHighlightError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error(ToggleHighlightError v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
}

class Summary extends $pb.GeneratedMessage {
  factory Summary({
    $core.int? matchId,
    $1.Timestamp? startedAtUtc,
    $1.Timestamp? completedAtUtc,
    $2.Duration? duration,
    Format? format,
    $core.String? teamOneName,
    $core.String? teamTwoName,
    SetSummary? setOne,
    SetSummary? setTwo,
    SetSummary? setThree,
    SetSummary? setFour,
    SetSummary? setFive,
  }) {
    final $result = create();
    if (matchId != null) {
      $result.matchId = matchId;
    }
    if (startedAtUtc != null) {
      $result.startedAtUtc = startedAtUtc;
    }
    if (completedAtUtc != null) {
      $result.completedAtUtc = completedAtUtc;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    if (format != null) {
      $result.format = format;
    }
    if (teamOneName != null) {
      $result.teamOneName = teamOneName;
    }
    if (teamTwoName != null) {
      $result.teamTwoName = teamTwoName;
    }
    if (setOne != null) {
      $result.setOne = setOne;
    }
    if (setTwo != null) {
      $result.setTwo = setTwo;
    }
    if (setThree != null) {
      $result.setThree = setThree;
    }
    if (setFour != null) {
      $result.setFour = setFour;
    }
    if (setFive != null) {
      $result.setFive = setFive;
    }
    return $result;
  }
  Summary._() : super();
  factory Summary.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Summary.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Summary', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'matchId', $pb.PbFieldType.O3)
    ..aOM<$1.Timestamp>(2, _omitFieldNames ? '' : 'startedAtUtc', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'completedAtUtc', subBuilder: $1.Timestamp.create)
    ..aOM<$2.Duration>(4, _omitFieldNames ? '' : 'duration', subBuilder: $2.Duration.create)
    ..e<Format>(5, _omitFieldNames ? '' : 'format', $pb.PbFieldType.OE, defaultOrMaker: Format.BEST_OF_ONE, valueOf: Format.valueOf, enumValues: Format.values)
    ..aOS(7, _omitFieldNames ? '' : 'teamOneName')
    ..aOS(8, _omitFieldNames ? '' : 'teamTwoName')
    ..aOM<SetSummary>(9, _omitFieldNames ? '' : 'setOne', subBuilder: SetSummary.create)
    ..aOM<SetSummary>(10, _omitFieldNames ? '' : 'setTwo', subBuilder: SetSummary.create)
    ..aOM<SetSummary>(11, _omitFieldNames ? '' : 'setThree', subBuilder: SetSummary.create)
    ..aOM<SetSummary>(12, _omitFieldNames ? '' : 'setFour', subBuilder: SetSummary.create)
    ..aOM<SetSummary>(13, _omitFieldNames ? '' : 'setFive', subBuilder: SetSummary.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Summary clone() => Summary()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Summary copyWith(void Function(Summary) updates) => super.copyWith((message) => updates(message as Summary)) as Summary;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Summary create() => Summary._();
  Summary createEmptyInstance() => create();
  static $pb.PbList<Summary> createRepeated() => $pb.PbList<Summary>();
  @$core.pragma('dart2js:noInline')
  static Summary getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Summary>(create);
  static Summary? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get matchId => $_getIZ(0);
  @$pb.TagNumber(1)
  set matchId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMatchId() => clearField(1);

  @$pb.TagNumber(2)
  $1.Timestamp get startedAtUtc => $_getN(1);
  @$pb.TagNumber(2)
  set startedAtUtc($1.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartedAtUtc() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartedAtUtc() => clearField(2);
  @$pb.TagNumber(2)
  $1.Timestamp ensureStartedAtUtc() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Timestamp get completedAtUtc => $_getN(2);
  @$pb.TagNumber(3)
  set completedAtUtc($1.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCompletedAtUtc() => $_has(2);
  @$pb.TagNumber(3)
  void clearCompletedAtUtc() => clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureCompletedAtUtc() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.Duration get duration => $_getN(3);
  @$pb.TagNumber(4)
  set duration($2.Duration v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuration() => clearField(4);
  @$pb.TagNumber(4)
  $2.Duration ensureDuration() => $_ensure(3);

  @$pb.TagNumber(5)
  Format get format => $_getN(4);
  @$pb.TagNumber(5)
  set format(Format v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasFormat() => $_has(4);
  @$pb.TagNumber(5)
  void clearFormat() => clearField(5);

  @$pb.TagNumber(7)
  $core.String get teamOneName => $_getSZ(5);
  @$pb.TagNumber(7)
  set teamOneName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasTeamOneName() => $_has(5);
  @$pb.TagNumber(7)
  void clearTeamOneName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get teamTwoName => $_getSZ(6);
  @$pb.TagNumber(8)
  set teamTwoName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasTeamTwoName() => $_has(6);
  @$pb.TagNumber(8)
  void clearTeamTwoName() => clearField(8);

  @$pb.TagNumber(9)
  SetSummary get setOne => $_getN(7);
  @$pb.TagNumber(9)
  set setOne(SetSummary v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasSetOne() => $_has(7);
  @$pb.TagNumber(9)
  void clearSetOne() => clearField(9);
  @$pb.TagNumber(9)
  SetSummary ensureSetOne() => $_ensure(7);

  @$pb.TagNumber(10)
  SetSummary get setTwo => $_getN(8);
  @$pb.TagNumber(10)
  set setTwo(SetSummary v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasSetTwo() => $_has(8);
  @$pb.TagNumber(10)
  void clearSetTwo() => clearField(10);
  @$pb.TagNumber(10)
  SetSummary ensureSetTwo() => $_ensure(8);

  @$pb.TagNumber(11)
  SetSummary get setThree => $_getN(9);
  @$pb.TagNumber(11)
  set setThree(SetSummary v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasSetThree() => $_has(9);
  @$pb.TagNumber(11)
  void clearSetThree() => clearField(11);
  @$pb.TagNumber(11)
  SetSummary ensureSetThree() => $_ensure(9);

  @$pb.TagNumber(12)
  SetSummary get setFour => $_getN(10);
  @$pb.TagNumber(12)
  set setFour(SetSummary v) { setField(12, v); }
  @$pb.TagNumber(12)
  $core.bool hasSetFour() => $_has(10);
  @$pb.TagNumber(12)
  void clearSetFour() => clearField(12);
  @$pb.TagNumber(12)
  SetSummary ensureSetFour() => $_ensure(10);

  @$pb.TagNumber(13)
  SetSummary get setFive => $_getN(11);
  @$pb.TagNumber(13)
  set setFive(SetSummary v) { setField(13, v); }
  @$pb.TagNumber(13)
  $core.bool hasSetFive() => $_has(11);
  @$pb.TagNumber(13)
  void clearSetFive() => clearField(13);
  @$pb.TagNumber(13)
  SetSummary ensureSetFive() => $_ensure(11);
}

class SetSummary extends $pb.GeneratedMessage {
  factory SetSummary({
    $core.int? teamOneGames,
    $core.int? teamTwoGames,
    $core.bool? tiebreak,
    $core.int? teamOneTiebreakPoints,
    $core.int? teamTwoTiebreakPoints,
  }) {
    final $result = create();
    if (teamOneGames != null) {
      $result.teamOneGames = teamOneGames;
    }
    if (teamTwoGames != null) {
      $result.teamTwoGames = teamTwoGames;
    }
    if (tiebreak != null) {
      $result.tiebreak = tiebreak;
    }
    if (teamOneTiebreakPoints != null) {
      $result.teamOneTiebreakPoints = teamOneTiebreakPoints;
    }
    if (teamTwoTiebreakPoints != null) {
      $result.teamTwoTiebreakPoints = teamTwoTiebreakPoints;
    }
    return $result;
  }
  SetSummary._() : super();
  factory SetSummary.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SetSummary.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SetSummary', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'teamOneGames', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'teamTwoGames', $pb.PbFieldType.O3)
    ..aOB(3, _omitFieldNames ? '' : 'tiebreak')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'teamOneTiebreakPoints', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'teamTwoTiebreakPoints', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SetSummary clone() => SetSummary()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SetSummary copyWith(void Function(SetSummary) updates) => super.copyWith((message) => updates(message as SetSummary)) as SetSummary;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SetSummary create() => SetSummary._();
  SetSummary createEmptyInstance() => create();
  static $pb.PbList<SetSummary> createRepeated() => $pb.PbList<SetSummary>();
  @$core.pragma('dart2js:noInline')
  static SetSummary getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SetSummary>(create);
  static SetSummary? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get teamOneGames => $_getIZ(0);
  @$pb.TagNumber(1)
  set teamOneGames($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasTeamOneGames() => $_has(0);
  @$pb.TagNumber(1)
  void clearTeamOneGames() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get teamTwoGames => $_getIZ(1);
  @$pb.TagNumber(2)
  set teamTwoGames($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTeamTwoGames() => $_has(1);
  @$pb.TagNumber(2)
  void clearTeamTwoGames() => clearField(2);

  @$pb.TagNumber(3)
  $core.bool get tiebreak => $_getBF(2);
  @$pb.TagNumber(3)
  set tiebreak($core.bool v) { $_setBool(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTiebreak() => $_has(2);
  @$pb.TagNumber(3)
  void clearTiebreak() => clearField(3);

  @$pb.TagNumber(4)
  $core.int get teamOneTiebreakPoints => $_getIZ(3);
  @$pb.TagNumber(4)
  set teamOneTiebreakPoints($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTeamOneTiebreakPoints() => $_has(3);
  @$pb.TagNumber(4)
  void clearTeamOneTiebreakPoints() => clearField(4);

  @$pb.TagNumber(5)
  $core.int get teamTwoTiebreakPoints => $_getIZ(4);
  @$pb.TagNumber(5)
  set teamTwoTiebreakPoints($core.int v) { $_setSignedInt32(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTeamTwoTiebreakPoints() => $_has(4);
  @$pb.TagNumber(5)
  void clearTeamTwoTiebreakPoints() => clearField(5);
}

class SummaryV2 extends $pb.GeneratedMessage {
  factory SummaryV2({
    $core.int? matchId,
    $1.Timestamp? startedAtUtc,
    $1.Timestamp? completedAtUtc,
    $2.Duration? duration,
    Format? format,
    $core.String? teamOneName,
    $core.String? teamTwoName,
    $core.int? teamOneSets,
    $core.int? teamTwoSets,
    $core.Iterable<TeamSetScore>? teamOneSetScores,
    $core.Iterable<TeamSetScore>? teamTwoSetScores,
  }) {
    final $result = create();
    if (matchId != null) {
      $result.matchId = matchId;
    }
    if (startedAtUtc != null) {
      $result.startedAtUtc = startedAtUtc;
    }
    if (completedAtUtc != null) {
      $result.completedAtUtc = completedAtUtc;
    }
    if (duration != null) {
      $result.duration = duration;
    }
    if (format != null) {
      $result.format = format;
    }
    if (teamOneName != null) {
      $result.teamOneName = teamOneName;
    }
    if (teamTwoName != null) {
      $result.teamTwoName = teamTwoName;
    }
    if (teamOneSets != null) {
      $result.teamOneSets = teamOneSets;
    }
    if (teamTwoSets != null) {
      $result.teamTwoSets = teamTwoSets;
    }
    if (teamOneSetScores != null) {
      $result.teamOneSetScores.addAll(teamOneSetScores);
    }
    if (teamTwoSetScores != null) {
      $result.teamTwoSetScores.addAll(teamTwoSetScores);
    }
    return $result;
  }
  SummaryV2._() : super();
  factory SummaryV2.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory SummaryV2.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'SummaryV2', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'matchId', $pb.PbFieldType.O3)
    ..aOM<$1.Timestamp>(2, _omitFieldNames ? '' : 'startedAtUtc', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'completedAtUtc', subBuilder: $1.Timestamp.create)
    ..aOM<$2.Duration>(4, _omitFieldNames ? '' : 'duration', subBuilder: $2.Duration.create)
    ..e<Format>(5, _omitFieldNames ? '' : 'format', $pb.PbFieldType.OE, defaultOrMaker: Format.BEST_OF_ONE, valueOf: Format.valueOf, enumValues: Format.values)
    ..aOS(7, _omitFieldNames ? '' : 'teamOneName')
    ..aOS(8, _omitFieldNames ? '' : 'teamTwoName')
    ..a<$core.int>(9, _omitFieldNames ? '' : 'teamOneSets', $pb.PbFieldType.O3)
    ..a<$core.int>(10, _omitFieldNames ? '' : 'teamTwoSets', $pb.PbFieldType.O3)
    ..pc<TeamSetScore>(11, _omitFieldNames ? '' : 'teamOneSetScores', $pb.PbFieldType.PM, subBuilder: TeamSetScore.create)
    ..pc<TeamSetScore>(12, _omitFieldNames ? '' : 'teamTwoSetScores', $pb.PbFieldType.PM, subBuilder: TeamSetScore.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  SummaryV2 clone() => SummaryV2()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  SummaryV2 copyWith(void Function(SummaryV2) updates) => super.copyWith((message) => updates(message as SummaryV2)) as SummaryV2;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SummaryV2 create() => SummaryV2._();
  SummaryV2 createEmptyInstance() => create();
  static $pb.PbList<SummaryV2> createRepeated() => $pb.PbList<SummaryV2>();
  @$core.pragma('dart2js:noInline')
  static SummaryV2 getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SummaryV2>(create);
  static SummaryV2? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get matchId => $_getIZ(0);
  @$pb.TagNumber(1)
  set matchId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMatchId() => clearField(1);

  @$pb.TagNumber(2)
  $1.Timestamp get startedAtUtc => $_getN(1);
  @$pb.TagNumber(2)
  set startedAtUtc($1.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasStartedAtUtc() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartedAtUtc() => clearField(2);
  @$pb.TagNumber(2)
  $1.Timestamp ensureStartedAtUtc() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.Timestamp get completedAtUtc => $_getN(2);
  @$pb.TagNumber(3)
  set completedAtUtc($1.Timestamp v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasCompletedAtUtc() => $_has(2);
  @$pb.TagNumber(3)
  void clearCompletedAtUtc() => clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureCompletedAtUtc() => $_ensure(2);

  @$pb.TagNumber(4)
  $2.Duration get duration => $_getN(3);
  @$pb.TagNumber(4)
  set duration($2.Duration v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasDuration() => $_has(3);
  @$pb.TagNumber(4)
  void clearDuration() => clearField(4);
  @$pb.TagNumber(4)
  $2.Duration ensureDuration() => $_ensure(3);

  @$pb.TagNumber(5)
  Format get format => $_getN(4);
  @$pb.TagNumber(5)
  set format(Format v) { setField(5, v); }
  @$pb.TagNumber(5)
  $core.bool hasFormat() => $_has(4);
  @$pb.TagNumber(5)
  void clearFormat() => clearField(5);

  @$pb.TagNumber(7)
  $core.String get teamOneName => $_getSZ(5);
  @$pb.TagNumber(7)
  set teamOneName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasTeamOneName() => $_has(5);
  @$pb.TagNumber(7)
  void clearTeamOneName() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get teamTwoName => $_getSZ(6);
  @$pb.TagNumber(8)
  set teamTwoName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasTeamTwoName() => $_has(6);
  @$pb.TagNumber(8)
  void clearTeamTwoName() => clearField(8);

  @$pb.TagNumber(9)
  $core.int get teamOneSets => $_getIZ(7);
  @$pb.TagNumber(9)
  set teamOneSets($core.int v) { $_setSignedInt32(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasTeamOneSets() => $_has(7);
  @$pb.TagNumber(9)
  void clearTeamOneSets() => clearField(9);

  @$pb.TagNumber(10)
  $core.int get teamTwoSets => $_getIZ(8);
  @$pb.TagNumber(10)
  set teamTwoSets($core.int v) { $_setSignedInt32(8, v); }
  @$pb.TagNumber(10)
  $core.bool hasTeamTwoSets() => $_has(8);
  @$pb.TagNumber(10)
  void clearTeamTwoSets() => clearField(10);

  @$pb.TagNumber(11)
  $core.List<TeamSetScore> get teamOneSetScores => $_getList(9);

  @$pb.TagNumber(12)
  $core.List<TeamSetScore> get teamTwoSetScores => $_getList(10);
}

class TeamSetScore extends $pb.GeneratedMessage {
  factory TeamSetScore({
    $core.int? setNumber,
    $core.int? games,
    $core.int? tiebreakPoints,
    $core.bool? setWon,
  }) {
    final $result = create();
    if (setNumber != null) {
      $result.setNumber = setNumber;
    }
    if (games != null) {
      $result.games = games;
    }
    if (tiebreakPoints != null) {
      $result.tiebreakPoints = tiebreakPoints;
    }
    if (setWon != null) {
      $result.setWon = setWon;
    }
    return $result;
  }
  TeamSetScore._() : super();
  factory TeamSetScore.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory TeamSetScore.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'TeamSetScore', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'setNumber', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'games', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'tiebreakPoints', $pb.PbFieldType.O3)
    ..aOB(4, _omitFieldNames ? '' : 'setWon')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  TeamSetScore clone() => TeamSetScore()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  TeamSetScore copyWith(void Function(TeamSetScore) updates) => super.copyWith((message) => updates(message as TeamSetScore)) as TeamSetScore;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static TeamSetScore create() => TeamSetScore._();
  TeamSetScore createEmptyInstance() => create();
  static $pb.PbList<TeamSetScore> createRepeated() => $pb.PbList<TeamSetScore>();
  @$core.pragma('dart2js:noInline')
  static TeamSetScore getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<TeamSetScore>(create);
  static TeamSetScore? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get setNumber => $_getIZ(0);
  @$pb.TagNumber(1)
  set setNumber($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSetNumber() => $_has(0);
  @$pb.TagNumber(1)
  void clearSetNumber() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get games => $_getIZ(1);
  @$pb.TagNumber(2)
  set games($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasGames() => $_has(1);
  @$pb.TagNumber(2)
  void clearGames() => clearField(2);

  @$pb.TagNumber(3)
  $core.int get tiebreakPoints => $_getIZ(2);
  @$pb.TagNumber(3)
  set tiebreakPoints($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasTiebreakPoints() => $_has(2);
  @$pb.TagNumber(3)
  void clearTiebreakPoints() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get setWon => $_getBF(3);
  @$pb.TagNumber(4)
  set setWon($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasSetWon() => $_has(3);
  @$pb.TagNumber(4)
  void clearSetWon() => clearField(4);
}

class GetSummariesRequest extends $pb.GeneratedMessage {
  factory GetSummariesRequest({
    $core.int? pageSize,
    $core.int? pageNumber,
  }) {
    final $result = create();
    if (pageSize != null) {
      $result.pageSize = pageSize;
    }
    if (pageNumber != null) {
      $result.pageNumber = pageNumber;
    }
    return $result;
  }
  GetSummariesRequest._() : super();
  factory GetSummariesRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSummariesRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSummariesRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'pageNumber', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSummariesRequest clone() => GetSummariesRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSummariesRequest copyWith(void Function(GetSummariesRequest) updates) => super.copyWith((message) => updates(message as GetSummariesRequest)) as GetSummariesRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSummariesRequest create() => GetSummariesRequest._();
  GetSummariesRequest createEmptyInstance() => create();
  static $pb.PbList<GetSummariesRequest> createRepeated() => $pb.PbList<GetSummariesRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSummariesRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSummariesRequest>(create);
  static GetSummariesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get pageSize => $_getIZ(0);
  @$pb.TagNumber(1)
  set pageSize($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasPageSize() => $_has(0);
  @$pb.TagNumber(1)
  void clearPageSize() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get pageNumber => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageNumber($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageNumber() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageNumber() => clearField(2);
}

class GetSummariesReply extends $pb.GeneratedMessage {
  factory GetSummariesReply({
    $core.bool? success,
    $core.int? pageCount,
    $core.Iterable<Summary>? summaries,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (pageCount != null) {
      $result.pageCount = pageCount;
    }
    if (summaries != null) {
      $result.summaries.addAll(summaries);
    }
    return $result;
  }
  GetSummariesReply._() : super();
  factory GetSummariesReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSummariesReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSummariesReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'pageCount', $pb.PbFieldType.O3)
    ..pc<Summary>(3, _omitFieldNames ? '' : 'summaries', $pb.PbFieldType.PM, subBuilder: Summary.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSummariesReply clone() => GetSummariesReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSummariesReply copyWith(void Function(GetSummariesReply) updates) => super.copyWith((message) => updates(message as GetSummariesReply)) as GetSummariesReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSummariesReply create() => GetSummariesReply._();
  GetSummariesReply createEmptyInstance() => create();
  static $pb.PbList<GetSummariesReply> createRepeated() => $pb.PbList<GetSummariesReply>();
  @$core.pragma('dart2js:noInline')
  static GetSummariesReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSummariesReply>(create);
  static GetSummariesReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get pageCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<Summary> get summaries => $_getList(2);
}

class GetSummariesV2Reply extends $pb.GeneratedMessage {
  factory GetSummariesV2Reply({
    $core.bool? success,
    $core.int? pageCount,
    $core.Iterable<SummaryV2>? summaries,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (pageCount != null) {
      $result.pageCount = pageCount;
    }
    if (summaries != null) {
      $result.summaries.addAll(summaries);
    }
    return $result;
  }
  GetSummariesV2Reply._() : super();
  factory GetSummariesV2Reply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSummariesV2Reply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSummariesV2Reply', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'pageCount', $pb.PbFieldType.O3)
    ..pc<SummaryV2>(3, _omitFieldNames ? '' : 'summaries', $pb.PbFieldType.PM, subBuilder: SummaryV2.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSummariesV2Reply clone() => GetSummariesV2Reply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSummariesV2Reply copyWith(void Function(GetSummariesV2Reply) updates) => super.copyWith((message) => updates(message as GetSummariesV2Reply)) as GetSummariesV2Reply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSummariesV2Reply create() => GetSummariesV2Reply._();
  GetSummariesV2Reply createEmptyInstance() => create();
  static $pb.PbList<GetSummariesV2Reply> createRepeated() => $pb.PbList<GetSummariesV2Reply>();
  @$core.pragma('dart2js:noInline')
  static GetSummariesV2Reply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSummariesV2Reply>(create);
  static GetSummariesV2Reply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get pageCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set pageCount($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPageCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearPageCount() => clearField(2);

  @$pb.TagNumber(3)
  $core.List<SummaryV2> get summaries => $_getList(2);
}

class GetStateRequest extends $pb.GeneratedMessage {
  factory GetStateRequest({
    $core.int? matchId,
  }) {
    final $result = create();
    if (matchId != null) {
      $result.matchId = matchId;
    }
    return $result;
  }
  GetStateRequest._() : super();
  factory GetStateRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStateRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStateRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'matchId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStateRequest clone() => GetStateRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStateRequest copyWith(void Function(GetStateRequest) updates) => super.copyWith((message) => updates(message as GetStateRequest)) as GetStateRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStateRequest create() => GetStateRequest._();
  GetStateRequest createEmptyInstance() => create();
  static $pb.PbList<GetStateRequest> createRepeated() => $pb.PbList<GetStateRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStateRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStateRequest>(create);
  static GetStateRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get matchId => $_getIZ(0);
  @$pb.TagNumber(1)
  set matchId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMatchId() => clearField(1);
}

class GetStateReply extends $pb.GeneratedMessage {
  factory GetStateReply({
    $core.bool? success,
    State? state,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (state != null) {
      $result.state = state;
    }
    return $result;
  }
  GetStateReply._() : super();
  factory GetStateReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStateReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStateReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<State>(2, _omitFieldNames ? '' : 'state', subBuilder: State.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStateReply clone() => GetStateReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStateReply copyWith(void Function(GetStateReply) updates) => super.copyWith((message) => updates(message as GetStateReply)) as GetStateReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStateReply create() => GetStateReply._();
  GetStateReply createEmptyInstance() => create();
  static $pb.PbList<GetStateReply> createRepeated() => $pb.PbList<GetStateReply>();
  @$core.pragma('dart2js:noInline')
  static GetStateReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStateReply>(create);
  static GetStateReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  State get state => $_getN(1);
  @$pb.TagNumber(2)
  set state(State v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasState() => $_has(1);
  @$pb.TagNumber(2)
  void clearState() => clearField(2);
  @$pb.TagNumber(2)
  State ensureState() => $_ensure(1);
}

class State extends $pb.GeneratedMessage {
  factory State({
    $core.int? version,
    $1.Timestamp? createdAtUtc,
    Team? serving,
    $core.bool? highlighted,
    $core.String? teamOneName,
    $core.String? teamTwoName,
    $core.String? teamOnePoints,
    $core.String? teamTwoPoints,
    $core.String? teamOneGames,
    $core.String? teamTwoGames,
    $core.String? teamOneSets,
    $core.String? teamTwoSets,
    $core.bool? completed,
  }) {
    final $result = create();
    if (version != null) {
      $result.version = version;
    }
    if (createdAtUtc != null) {
      $result.createdAtUtc = createdAtUtc;
    }
    if (serving != null) {
      $result.serving = serving;
    }
    if (highlighted != null) {
      $result.highlighted = highlighted;
    }
    if (teamOneName != null) {
      $result.teamOneName = teamOneName;
    }
    if (teamTwoName != null) {
      $result.teamTwoName = teamTwoName;
    }
    if (teamOnePoints != null) {
      $result.teamOnePoints = teamOnePoints;
    }
    if (teamTwoPoints != null) {
      $result.teamTwoPoints = teamTwoPoints;
    }
    if (teamOneGames != null) {
      $result.teamOneGames = teamOneGames;
    }
    if (teamTwoGames != null) {
      $result.teamTwoGames = teamTwoGames;
    }
    if (teamOneSets != null) {
      $result.teamOneSets = teamOneSets;
    }
    if (teamTwoSets != null) {
      $result.teamTwoSets = teamTwoSets;
    }
    if (completed != null) {
      $result.completed = completed;
    }
    return $result;
  }
  State._() : super();
  factory State.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory State.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'State', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..aOM<$1.Timestamp>(2, _omitFieldNames ? '' : 'createdAtUtc', subBuilder: $1.Timestamp.create)
    ..e<Team>(3, _omitFieldNames ? '' : 'serving', $pb.PbFieldType.OE, defaultOrMaker: Team.TEAM_ONE, valueOf: Team.valueOf, enumValues: Team.values)
    ..aOB(4, _omitFieldNames ? '' : 'highlighted')
    ..aOS(5, _omitFieldNames ? '' : 'teamOneName')
    ..aOS(6, _omitFieldNames ? '' : 'teamTwoName')
    ..aOS(7, _omitFieldNames ? '' : 'teamOnePoints')
    ..aOS(8, _omitFieldNames ? '' : 'teamTwoPoints')
    ..aOS(9, _omitFieldNames ? '' : 'teamOneGames')
    ..aOS(10, _omitFieldNames ? '' : 'teamTwoGames')
    ..aOS(11, _omitFieldNames ? '' : 'teamOneSets')
    ..aOS(12, _omitFieldNames ? '' : 'teamTwoSets')
    ..aOB(13, _omitFieldNames ? '' : 'completed')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  State clone() => State()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  State copyWith(void Function(State) updates) => super.copyWith((message) => updates(message as State)) as State;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static State create() => State._();
  State createEmptyInstance() => create();
  static $pb.PbList<State> createRepeated() => $pb.PbList<State>();
  @$core.pragma('dart2js:noInline')
  static State getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<State>(create);
  static State? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get version => $_getIZ(0);
  @$pb.TagNumber(1)
  set version($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasVersion() => $_has(0);
  @$pb.TagNumber(1)
  void clearVersion() => clearField(1);

  @$pb.TagNumber(2)
  $1.Timestamp get createdAtUtc => $_getN(1);
  @$pb.TagNumber(2)
  set createdAtUtc($1.Timestamp v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasCreatedAtUtc() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAtUtc() => clearField(2);
  @$pb.TagNumber(2)
  $1.Timestamp ensureCreatedAtUtc() => $_ensure(1);

  @$pb.TagNumber(3)
  Team get serving => $_getN(2);
  @$pb.TagNumber(3)
  set serving(Team v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasServing() => $_has(2);
  @$pb.TagNumber(3)
  void clearServing() => clearField(3);

  @$pb.TagNumber(4)
  $core.bool get highlighted => $_getBF(3);
  @$pb.TagNumber(4)
  set highlighted($core.bool v) { $_setBool(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasHighlighted() => $_has(3);
  @$pb.TagNumber(4)
  void clearHighlighted() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get teamOneName => $_getSZ(4);
  @$pb.TagNumber(5)
  set teamOneName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTeamOneName() => $_has(4);
  @$pb.TagNumber(5)
  void clearTeamOneName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get teamTwoName => $_getSZ(5);
  @$pb.TagNumber(6)
  set teamTwoName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTeamTwoName() => $_has(5);
  @$pb.TagNumber(6)
  void clearTeamTwoName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get teamOnePoints => $_getSZ(6);
  @$pb.TagNumber(7)
  set teamOnePoints($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTeamOnePoints() => $_has(6);
  @$pb.TagNumber(7)
  void clearTeamOnePoints() => clearField(7);

  @$pb.TagNumber(8)
  $core.String get teamTwoPoints => $_getSZ(7);
  @$pb.TagNumber(8)
  set teamTwoPoints($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(8)
  $core.bool hasTeamTwoPoints() => $_has(7);
  @$pb.TagNumber(8)
  void clearTeamTwoPoints() => clearField(8);

  @$pb.TagNumber(9)
  $core.String get teamOneGames => $_getSZ(8);
  @$pb.TagNumber(9)
  set teamOneGames($core.String v) { $_setString(8, v); }
  @$pb.TagNumber(9)
  $core.bool hasTeamOneGames() => $_has(8);
  @$pb.TagNumber(9)
  void clearTeamOneGames() => clearField(9);

  @$pb.TagNumber(10)
  $core.String get teamTwoGames => $_getSZ(9);
  @$pb.TagNumber(10)
  set teamTwoGames($core.String v) { $_setString(9, v); }
  @$pb.TagNumber(10)
  $core.bool hasTeamTwoGames() => $_has(9);
  @$pb.TagNumber(10)
  void clearTeamTwoGames() => clearField(10);

  @$pb.TagNumber(11)
  $core.String get teamOneSets => $_getSZ(10);
  @$pb.TagNumber(11)
  set teamOneSets($core.String v) { $_setString(10, v); }
  @$pb.TagNumber(11)
  $core.bool hasTeamOneSets() => $_has(10);
  @$pb.TagNumber(11)
  void clearTeamOneSets() => clearField(11);

  @$pb.TagNumber(12)
  $core.String get teamTwoSets => $_getSZ(11);
  @$pb.TagNumber(12)
  set teamTwoSets($core.String v) { $_setString(11, v); }
  @$pb.TagNumber(12)
  $core.bool hasTeamTwoSets() => $_has(11);
  @$pb.TagNumber(12)
  void clearTeamTwoSets() => clearField(12);

  @$pb.TagNumber(13)
  $core.bool get completed => $_getBF(12);
  @$pb.TagNumber(13)
  set completed($core.bool v) { $_setBool(12, v); }
  @$pb.TagNumber(13)
  $core.bool hasCompleted() => $_has(12);
  @$pb.TagNumber(13)
  void clearCompleted() => clearField(13);
}

class GetStateHistoryRequest extends $pb.GeneratedMessage {
  factory GetStateHistoryRequest({
    $core.int? matchId,
  }) {
    final $result = create();
    if (matchId != null) {
      $result.matchId = matchId;
    }
    return $result;
  }
  GetStateHistoryRequest._() : super();
  factory GetStateHistoryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStateHistoryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStateHistoryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'matchId', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStateHistoryRequest clone() => GetStateHistoryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStateHistoryRequest copyWith(void Function(GetStateHistoryRequest) updates) => super.copyWith((message) => updates(message as GetStateHistoryRequest)) as GetStateHistoryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStateHistoryRequest create() => GetStateHistoryRequest._();
  GetStateHistoryRequest createEmptyInstance() => create();
  static $pb.PbList<GetStateHistoryRequest> createRepeated() => $pb.PbList<GetStateHistoryRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStateHistoryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStateHistoryRequest>(create);
  static GetStateHistoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get matchId => $_getIZ(0);
  @$pb.TagNumber(1)
  set matchId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMatchId() => clearField(1);
}

class GetStateHistoryReply extends $pb.GeneratedMessage {
  factory GetStateHistoryReply({
    $core.bool? success,
    $core.Iterable<State>? states,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    if (states != null) {
      $result.states.addAll(states);
    }
    return $result;
  }
  GetStateHistoryReply._() : super();
  factory GetStateHistoryReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStateHistoryReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStateHistoryReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..pc<State>(2, _omitFieldNames ? '' : 'states', $pb.PbFieldType.PM, subBuilder: State.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStateHistoryReply clone() => GetStateHistoryReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStateHistoryReply copyWith(void Function(GetStateHistoryReply) updates) => super.copyWith((message) => updates(message as GetStateHistoryReply)) as GetStateHistoryReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStateHistoryReply create() => GetStateHistoryReply._();
  GetStateHistoryReply createEmptyInstance() => create();
  static $pb.PbList<GetStateHistoryReply> createRepeated() => $pb.PbList<GetStateHistoryReply>();
  @$core.pragma('dart2js:noInline')
  static GetStateHistoryReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStateHistoryReply>(create);
  static GetStateHistoryReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  $core.List<State> get states => $_getList(1);
}

class GetStateAtVersionRequest extends $pb.GeneratedMessage {
  factory GetStateAtVersionRequest({
    $core.int? matchId,
    $core.int? version,
  }) {
    final $result = create();
    if (matchId != null) {
      $result.matchId = matchId;
    }
    if (version != null) {
      $result.version = version;
    }
    return $result;
  }
  GetStateAtVersionRequest._() : super();
  factory GetStateAtVersionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStateAtVersionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStateAtVersionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'matchId', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStateAtVersionRequest clone() => GetStateAtVersionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStateAtVersionRequest copyWith(void Function(GetStateAtVersionRequest) updates) => super.copyWith((message) => updates(message as GetStateAtVersionRequest)) as GetStateAtVersionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStateAtVersionRequest create() => GetStateAtVersionRequest._();
  GetStateAtVersionRequest createEmptyInstance() => create();
  static $pb.PbList<GetStateAtVersionRequest> createRepeated() => $pb.PbList<GetStateAtVersionRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStateAtVersionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStateAtVersionRequest>(create);
  static GetStateAtVersionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get matchId => $_getIZ(0);
  @$pb.TagNumber(1)
  set matchId($core.int v) { $_setSignedInt32(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasMatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearMatchId() => clearField(1);

  @$pb.TagNumber(2)
  $core.int get version => $_getIZ(1);
  @$pb.TagNumber(2)
  set version($core.int v) { $_setSignedInt32(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasVersion() => $_has(1);
  @$pb.TagNumber(2)
  void clearVersion() => clearField(2);
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
