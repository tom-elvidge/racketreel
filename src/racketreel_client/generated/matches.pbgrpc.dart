//
//  Generated code. Do not modify.
//  source: matches.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'matches.pb.dart' as $0;

export 'matches.pb.dart';

@$pb.GrpcServiceName('RacketReel.Matches')
class MatchesClient extends $grpc.Client {
  static final _$getSummary = $grpc.ClientMethod<$0.GetSummaryRequest, $0.GetSummaryReply>(
      '/RacketReel.Matches/GetSummary',
      ($0.GetSummaryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetSummaryReply.fromBuffer(value));
  static final _$getSummaries = $grpc.ClientMethod<$0.GetSummariesRequest, $0.GetSummariesReply>(
      '/RacketReel.Matches/GetSummaries',
      ($0.GetSummariesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetSummariesReply.fromBuffer(value));
  static final _$getState = $grpc.ClientMethod<$0.GetStateRequest, $0.GetStateReply>(
      '/RacketReel.Matches/GetState',
      ($0.GetStateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetStateReply.fromBuffer(value));
  static final _$getStateAtVersion = $grpc.ClientMethod<$0.GetStateAtVersionRequest, $0.GetStateReply>(
      '/RacketReel.Matches/GetStateAtVersion',
      ($0.GetStateAtVersionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetStateReply.fromBuffer(value));
  static final _$configure = $grpc.ClientMethod<$0.ConfigureRequest, $0.ConfigureReply>(
      '/RacketReel.Matches/Configure',
      ($0.ConfigureRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ConfigureReply.fromBuffer(value));
  static final _$addTeamOnePoint = $grpc.ClientMethod<$0.PointRequest, $0.PointReply>(
      '/RacketReel.Matches/AddTeamOnePoint',
      ($0.PointRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PointReply.fromBuffer(value));
  static final _$addTeamTwoPoint = $grpc.ClientMethod<$0.PointRequest, $0.PointReply>(
      '/RacketReel.Matches/AddTeamTwoPoint',
      ($0.PointRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PointReply.fromBuffer(value));
  static final _$undoPoint = $grpc.ClientMethod<$0.PointRequest, $0.PointReply>(
      '/RacketReel.Matches/UndoPoint',
      ($0.PointRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.PointReply.fromBuffer(value));

  MatchesClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetSummaryReply> getSummary($0.GetSummaryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSummary, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetSummariesReply> getSummaries($0.GetSummariesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSummaries, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetStateReply> getState($0.GetStateRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getState, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetStateReply> getStateAtVersion($0.GetStateAtVersionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStateAtVersion, request, options: options);
  }

  $grpc.ResponseFuture<$0.ConfigureReply> configure($0.ConfigureRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$configure, request, options: options);
  }

  $grpc.ResponseFuture<$0.PointReply> addTeamOnePoint($0.PointRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTeamOnePoint, request, options: options);
  }

  $grpc.ResponseFuture<$0.PointReply> addTeamTwoPoint($0.PointRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addTeamTwoPoint, request, options: options);
  }

  $grpc.ResponseFuture<$0.PointReply> undoPoint($0.PointRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$undoPoint, request, options: options);
  }
}

@$pb.GrpcServiceName('RacketReel.Matches')
abstract class MatchesServiceBase extends $grpc.Service {
  $core.String get $name => 'RacketReel.Matches';

  MatchesServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetSummaryRequest, $0.GetSummaryReply>(
        'GetSummary',
        getSummary_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetSummaryRequest.fromBuffer(value),
        ($0.GetSummaryReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetSummariesRequest, $0.GetSummariesReply>(
        'GetSummaries',
        getSummaries_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetSummariesRequest.fromBuffer(value),
        ($0.GetSummariesReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetStateRequest, $0.GetStateReply>(
        'GetState',
        getState_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetStateRequest.fromBuffer(value),
        ($0.GetStateReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetStateAtVersionRequest, $0.GetStateReply>(
        'GetStateAtVersion',
        getStateAtVersion_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetStateAtVersionRequest.fromBuffer(value),
        ($0.GetStateReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ConfigureRequest, $0.ConfigureReply>(
        'Configure',
        configure_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ConfigureRequest.fromBuffer(value),
        ($0.ConfigureReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PointRequest, $0.PointReply>(
        'AddTeamOnePoint',
        addTeamOnePoint_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PointRequest.fromBuffer(value),
        ($0.PointReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PointRequest, $0.PointReply>(
        'AddTeamTwoPoint',
        addTeamTwoPoint_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PointRequest.fromBuffer(value),
        ($0.PointReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.PointRequest, $0.PointReply>(
        'UndoPoint',
        undoPoint_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.PointRequest.fromBuffer(value),
        ($0.PointReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetSummaryReply> getSummary_Pre($grpc.ServiceCall call, $async.Future<$0.GetSummaryRequest> request) async {
    return getSummary(call, await request);
  }

  $async.Future<$0.GetSummariesReply> getSummaries_Pre($grpc.ServiceCall call, $async.Future<$0.GetSummariesRequest> request) async {
    return getSummaries(call, await request);
  }

  $async.Future<$0.GetStateReply> getState_Pre($grpc.ServiceCall call, $async.Future<$0.GetStateRequest> request) async {
    return getState(call, await request);
  }

  $async.Future<$0.GetStateReply> getStateAtVersion_Pre($grpc.ServiceCall call, $async.Future<$0.GetStateAtVersionRequest> request) async {
    return getStateAtVersion(call, await request);
  }

  $async.Future<$0.ConfigureReply> configure_Pre($grpc.ServiceCall call, $async.Future<$0.ConfigureRequest> request) async {
    return configure(call, await request);
  }

  $async.Future<$0.PointReply> addTeamOnePoint_Pre($grpc.ServiceCall call, $async.Future<$0.PointRequest> request) async {
    return addTeamOnePoint(call, await request);
  }

  $async.Future<$0.PointReply> addTeamTwoPoint_Pre($grpc.ServiceCall call, $async.Future<$0.PointRequest> request) async {
    return addTeamTwoPoint(call, await request);
  }

  $async.Future<$0.PointReply> undoPoint_Pre($grpc.ServiceCall call, $async.Future<$0.PointRequest> request) async {
    return undoPoint(call, await request);
  }

  $async.Future<$0.GetSummaryReply> getSummary($grpc.ServiceCall call, $0.GetSummaryRequest request);
  $async.Future<$0.GetSummariesReply> getSummaries($grpc.ServiceCall call, $0.GetSummariesRequest request);
  $async.Future<$0.GetStateReply> getState($grpc.ServiceCall call, $0.GetStateRequest request);
  $async.Future<$0.GetStateReply> getStateAtVersion($grpc.ServiceCall call, $0.GetStateAtVersionRequest request);
  $async.Future<$0.ConfigureReply> configure($grpc.ServiceCall call, $0.ConfigureRequest request);
  $async.Future<$0.PointReply> addTeamOnePoint($grpc.ServiceCall call, $0.PointRequest request);
  $async.Future<$0.PointReply> addTeamTwoPoint($grpc.ServiceCall call, $0.PointRequest request);
  $async.Future<$0.PointReply> undoPoint($grpc.ServiceCall call, $0.PointRequest request);
}
