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

import 'google/protobuf/duration.pb.dart' as $2;
import 'google/protobuf/timestamp.pb.dart' as $1;
import 'matches.pbenum.dart';

export 'matches.pbenum.dart';

class ConfigureRequest extends $pb.GeneratedMessage {
  factory ConfigureRequest() => create();
  ConfigureRequest._() : super();
  factory ConfigureRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigureRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigureRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..e<Format>(1, _omitFieldNames ? '' : 'format', $pb.PbFieldType.OE, defaultOrMaker: Format.BEST_OF_ONE, valueOf: Format.valueOf, enumValues: Format.values)
    ..e<Team>(2, _omitFieldNames ? '' : 'servingFirst', $pb.PbFieldType.OE, defaultOrMaker: Team.TEAM_ONE, valueOf: Team.valueOf, enumValues: Team.values)
    ..e<PlayerCount>(3, _omitFieldNames ? '' : 'playerCount', $pb.PbFieldType.OE, defaultOrMaker: PlayerCount.SINGLES, valueOf: PlayerCount.valueOf, enumValues: PlayerCount.values)
    ..aOS(4, _omitFieldNames ? '' : 'teamOnePlayerOneName')
    ..aOS(5, _omitFieldNames ? '' : 'teamOnePlayerTwoName')
    ..aOS(6, _omitFieldNames ? '' : 'teamTwoPlayerOneName')
    ..aOS(7, _omitFieldNames ? '' : 'teamTwoPlayerTwoName')
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

  @$pb.TagNumber(3)
  PlayerCount get playerCount => $_getN(2);
  @$pb.TagNumber(3)
  set playerCount(PlayerCount v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasPlayerCount() => $_has(2);
  @$pb.TagNumber(3)
  void clearPlayerCount() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get teamOnePlayerOneName => $_getSZ(3);
  @$pb.TagNumber(4)
  set teamOnePlayerOneName($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasTeamOnePlayerOneName() => $_has(3);
  @$pb.TagNumber(4)
  void clearTeamOnePlayerOneName() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get teamOnePlayerTwoName => $_getSZ(4);
  @$pb.TagNumber(5)
  set teamOnePlayerTwoName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasTeamOnePlayerTwoName() => $_has(4);
  @$pb.TagNumber(5)
  void clearTeamOnePlayerTwoName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get teamTwoPlayerOneName => $_getSZ(5);
  @$pb.TagNumber(6)
  set teamTwoPlayerOneName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasTeamTwoPlayerOneName() => $_has(5);
  @$pb.TagNumber(6)
  void clearTeamTwoPlayerOneName() => clearField(6);

  @$pb.TagNumber(7)
  $core.String get teamTwoPlayerTwoName => $_getSZ(6);
  @$pb.TagNumber(7)
  set teamTwoPlayerTwoName($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(7)
  $core.bool hasTeamTwoPlayerTwoName() => $_has(6);
  @$pb.TagNumber(7)
  void clearTeamTwoPlayerTwoName() => clearField(7);
}

class ConfigureReply extends $pb.GeneratedMessage {
  factory ConfigureReply() => create();
  ConfigureReply._() : super();
  factory ConfigureReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ConfigureReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ConfigureReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..e<ConfigureError>(2, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE, defaultOrMaker: ConfigureError.MISSING_PLAYER_TWO_NAMES, valueOf: ConfigureError.valueOf, enumValues: ConfigureError.values)
    ..aOS(3, _omitFieldNames ? '' : 'matchId')
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
  $core.String get matchId => $_getSZ(2);
  @$pb.TagNumber(3)
  set matchId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasMatchId() => $_has(2);
  @$pb.TagNumber(3)
  void clearMatchId() => clearField(3);
}

class PointRequest extends $pb.GeneratedMessage {
  factory PointRequest() => create();
  PointRequest._() : super();
  factory PointRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PointRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PointRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PointRequest clone() => PointRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PointRequest copyWith(void Function(PointRequest) updates) => super.copyWith((message) => updates(message as PointRequest)) as PointRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PointRequest create() => PointRequest._();
  PointRequest createEmptyInstance() => create();
  static $pb.PbList<PointRequest> createRepeated() => $pb.PbList<PointRequest>();
  @$core.pragma('dart2js:noInline')
  static PointRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PointRequest>(create);
  static PointRequest? _defaultInstance;
}

class PointReply extends $pb.GeneratedMessage {
  factory PointReply() => create();
  PointReply._() : super();
  factory PointReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PointReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PointReply', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..e<PointError>(2, _omitFieldNames ? '' : 'error', $pb.PbFieldType.OE, defaultOrMaker: PointError.POINT_UNKNOWN, valueOf: PointError.valueOf, enumValues: PointError.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PointReply clone() => PointReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PointReply copyWith(void Function(PointReply) updates) => super.copyWith((message) => updates(message as PointReply)) as PointReply;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PointReply create() => PointReply._();
  PointReply createEmptyInstance() => create();
  static $pb.PbList<PointReply> createRepeated() => $pb.PbList<PointReply>();
  @$core.pragma('dart2js:noInline')
  static PointReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PointReply>(create);
  static PointReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  PointError get error => $_getN(1);
  @$pb.TagNumber(2)
  set error(PointError v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => clearField(2);
}

class GetSummaryRequest extends $pb.GeneratedMessage {
  factory GetSummaryRequest() => create();
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
  factory GetSummaryReply() => create();
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

class Summary extends $pb.GeneratedMessage {
  factory Summary() => create();
  Summary._() : super();
  factory Summary.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Summary.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Summary', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'matchId', $pb.PbFieldType.O3)
    ..aOM<$1.Timestamp>(2, _omitFieldNames ? '' : 'startedAtUtc', subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'completedAtUtc', subBuilder: $1.Timestamp.create)
    ..aOM<$2.Duration>(4, _omitFieldNames ? '' : 'duration', subBuilder: $2.Duration.create)
    ..e<Format>(5, _omitFieldNames ? '' : 'format', $pb.PbFieldType.OE, defaultOrMaker: Format.BEST_OF_ONE, valueOf: Format.valueOf, enumValues: Format.values)
    ..e<Team>(6, _omitFieldNames ? '' : 'servingFirst', $pb.PbFieldType.OE, defaultOrMaker: Team.TEAM_ONE, valueOf: Team.valueOf, enumValues: Team.values)
    ..aOM<SetSummary>(7, _omitFieldNames ? '' : 'setOne', subBuilder: SetSummary.create)
    ..aOM<SetSummary>(8, _omitFieldNames ? '' : 'setTwo', subBuilder: SetSummary.create)
    ..aOM<SetSummary>(9, _omitFieldNames ? '' : 'setThree', subBuilder: SetSummary.create)
    ..aOM<SetSummary>(10, _omitFieldNames ? '' : 'setFour', subBuilder: SetSummary.create)
    ..aOM<SetSummary>(11, _omitFieldNames ? '' : 'setFive', subBuilder: SetSummary.create)
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

  @$pb.TagNumber(6)
  Team get servingFirst => $_getN(5);
  @$pb.TagNumber(6)
  set servingFirst(Team v) { setField(6, v); }
  @$pb.TagNumber(6)
  $core.bool hasServingFirst() => $_has(5);
  @$pb.TagNumber(6)
  void clearServingFirst() => clearField(6);

  @$pb.TagNumber(7)
  SetSummary get setOne => $_getN(6);
  @$pb.TagNumber(7)
  set setOne(SetSummary v) { setField(7, v); }
  @$pb.TagNumber(7)
  $core.bool hasSetOne() => $_has(6);
  @$pb.TagNumber(7)
  void clearSetOne() => clearField(7);
  @$pb.TagNumber(7)
  SetSummary ensureSetOne() => $_ensure(6);

  @$pb.TagNumber(8)
  SetSummary get setTwo => $_getN(7);
  @$pb.TagNumber(8)
  set setTwo(SetSummary v) { setField(8, v); }
  @$pb.TagNumber(8)
  $core.bool hasSetTwo() => $_has(7);
  @$pb.TagNumber(8)
  void clearSetTwo() => clearField(8);
  @$pb.TagNumber(8)
  SetSummary ensureSetTwo() => $_ensure(7);

  @$pb.TagNumber(9)
  SetSummary get setThree => $_getN(8);
  @$pb.TagNumber(9)
  set setThree(SetSummary v) { setField(9, v); }
  @$pb.TagNumber(9)
  $core.bool hasSetThree() => $_has(8);
  @$pb.TagNumber(9)
  void clearSetThree() => clearField(9);
  @$pb.TagNumber(9)
  SetSummary ensureSetThree() => $_ensure(8);

  @$pb.TagNumber(10)
  SetSummary get setFour => $_getN(9);
  @$pb.TagNumber(10)
  set setFour(SetSummary v) { setField(10, v); }
  @$pb.TagNumber(10)
  $core.bool hasSetFour() => $_has(9);
  @$pb.TagNumber(10)
  void clearSetFour() => clearField(10);
  @$pb.TagNumber(10)
  SetSummary ensureSetFour() => $_ensure(9);

  @$pb.TagNumber(11)
  SetSummary get setFive => $_getN(10);
  @$pb.TagNumber(11)
  set setFive(SetSummary v) { setField(11, v); }
  @$pb.TagNumber(11)
  $core.bool hasSetFive() => $_has(10);
  @$pb.TagNumber(11)
  void clearSetFive() => clearField(11);
  @$pb.TagNumber(11)
  SetSummary ensureSetFive() => $_ensure(10);
}

class SetSummary extends $pb.GeneratedMessage {
  factory SetSummary() => create();
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

class GetSummariesRequest extends $pb.GeneratedMessage {
  factory GetSummariesRequest() => create();
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
  factory GetSummariesReply() => create();
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

class GetStateRequest extends $pb.GeneratedMessage {
  factory GetStateRequest() => create();
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
  factory GetStateReply() => create();
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
  factory State() => create();
  State._() : super();
  factory State.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory State.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'State', package: const $pb.PackageName(_omitMessageNames ? '' : 'RacketReel'), createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'version', $pb.PbFieldType.O3)
    ..aOM<$1.Timestamp>(2, _omitFieldNames ? '' : 'createdAtUtc', subBuilder: $1.Timestamp.create)
    ..e<Team>(3, _omitFieldNames ? '' : 'serving', $pb.PbFieldType.OE, defaultOrMaker: Team.TEAM_ONE, valueOf: Team.valueOf, enumValues: Team.values)
    ..aOB(4, _omitFieldNames ? '' : 'highlighted')
    ..aOS(5, _omitFieldNames ? '' : 'playerOneName')
    ..aOS(6, _omitFieldNames ? '' : 'playerTwoName')
    ..aOS(7, _omitFieldNames ? '' : 'teamOnePoints')
    ..aOS(8, _omitFieldNames ? '' : 'teamTwoPoints')
    ..aOS(9, _omitFieldNames ? '' : 'teamOneGames')
    ..aOS(10, _omitFieldNames ? '' : 'teamTwoGames')
    ..aOS(11, _omitFieldNames ? '' : 'teamOneSets')
    ..aOS(12, _omitFieldNames ? '' : 'teamTwoSets')
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
  $core.String get playerOneName => $_getSZ(4);
  @$pb.TagNumber(5)
  set playerOneName($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasPlayerOneName() => $_has(4);
  @$pb.TagNumber(5)
  void clearPlayerOneName() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get playerTwoName => $_getSZ(5);
  @$pb.TagNumber(6)
  set playerTwoName($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPlayerTwoName() => $_has(5);
  @$pb.TagNumber(6)
  void clearPlayerTwoName() => clearField(6);

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
}

class GetStateAtVersionRequest extends $pb.GeneratedMessage {
  factory GetStateAtVersionRequest() => create();
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
