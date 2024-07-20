//
//  Generated code. Do not modify.
//  source: matches.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
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
  static final _$getSummaryV2 = $grpc.ClientMethod<$0.GetSummaryRequest, $0.GetSummaryV2Reply>(
      '/RacketReel.Matches/GetSummaryV2',
      ($0.GetSummaryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetSummaryV2Reply.fromBuffer(value));
  static final _$getSummariesV2 = $grpc.ClientMethod<$0.GetSummariesRequest, $0.GetSummariesV2Reply>(
      '/RacketReel.Matches/GetSummariesV2',
      ($0.GetSummariesRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetSummariesV2Reply.fromBuffer(value));
  static final _$getState = $grpc.ClientMethod<$0.GetStateRequest, $0.GetStateReply>(
      '/RacketReel.Matches/GetState',
      ($0.GetStateRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetStateReply.fromBuffer(value));
  static final _$getStateHistory = $grpc.ClientMethod<$0.GetStateHistoryRequest, $0.GetStateHistoryReply>(
      '/RacketReel.Matches/GetStateHistory',
      ($0.GetStateHistoryRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetStateHistoryReply.fromBuffer(value));
  static final _$getStateAtVersion = $grpc.ClientMethod<$0.GetStateAtVersionRequest, $0.GetStateReply>(
      '/RacketReel.Matches/GetStateAtVersion',
      ($0.GetStateAtVersionRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetStateReply.fromBuffer(value));
  static final _$configure = $grpc.ClientMethod<$0.ConfigureRequest, $0.ConfigureReply>(
      '/RacketReel.Matches/Configure',
      ($0.ConfigureRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ConfigureReply.fromBuffer(value));
  static final _$addPoint = $grpc.ClientMethod<$0.AddPointRequest, $0.AddPointReply>(
      '/RacketReel.Matches/AddPoint',
      ($0.AddPointRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AddPointReply.fromBuffer(value));
  static final _$undoPoint = $grpc.ClientMethod<$0.UndoPointRequest, $0.UndoPointReply>(
      '/RacketReel.Matches/UndoPoint',
      ($0.UndoPointRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UndoPointReply.fromBuffer(value));
  static final _$toggleHighlight = $grpc.ClientMethod<$0.ToggleHighlightRequest, $0.ToggleHighlightReply>(
      '/RacketReel.Matches/ToggleHighlight',
      ($0.ToggleHighlightRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.ToggleHighlightReply.fromBuffer(value));
  static final _$getStateStream = $grpc.ClientMethod<$0.GetStateStreamRequest, $0.State>(
      '/RacketReel.Matches/GetStateStream',
      ($0.GetStateStreamRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.State.fromBuffer(value));

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

  $grpc.ResponseFuture<$0.GetSummaryV2Reply> getSummaryV2($0.GetSummaryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSummaryV2, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetSummariesV2Reply> getSummariesV2($0.GetSummariesRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getSummariesV2, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetStateReply> getState($0.GetStateRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getState, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetStateHistoryReply> getStateHistory($0.GetStateHistoryRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStateHistory, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetStateReply> getStateAtVersion($0.GetStateAtVersionRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getStateAtVersion, request, options: options);
  }

  $grpc.ResponseFuture<$0.ConfigureReply> configure($0.ConfigureRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$configure, request, options: options);
  }

  $grpc.ResponseFuture<$0.AddPointReply> addPoint($0.AddPointRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$addPoint, request, options: options);
  }

  $grpc.ResponseFuture<$0.UndoPointReply> undoPoint($0.UndoPointRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$undoPoint, request, options: options);
  }

  $grpc.ResponseFuture<$0.ToggleHighlightReply> toggleHighlight($0.ToggleHighlightRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$toggleHighlight, request, options: options);
  }

  $grpc.ResponseStream<$0.State> getStateStream($0.GetStateStreamRequest request, {$grpc.CallOptions? options}) {
    return $createStreamingCall(_$getStateStream, $async.Stream.fromIterable([request]), options: options);
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
    $addMethod($grpc.ServiceMethod<$0.GetSummaryRequest, $0.GetSummaryV2Reply>(
        'GetSummaryV2',
        getSummaryV2_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetSummaryRequest.fromBuffer(value),
        ($0.GetSummaryV2Reply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetSummariesRequest, $0.GetSummariesV2Reply>(
        'GetSummariesV2',
        getSummariesV2_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetSummariesRequest.fromBuffer(value),
        ($0.GetSummariesV2Reply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetStateRequest, $0.GetStateReply>(
        'GetState',
        getState_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetStateRequest.fromBuffer(value),
        ($0.GetStateReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetStateHistoryRequest, $0.GetStateHistoryReply>(
        'GetStateHistory',
        getStateHistory_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetStateHistoryRequest.fromBuffer(value),
        ($0.GetStateHistoryReply value) => value.writeToBuffer()));
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
    $addMethod($grpc.ServiceMethod<$0.AddPointRequest, $0.AddPointReply>(
        'AddPoint',
        addPoint_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AddPointRequest.fromBuffer(value),
        ($0.AddPointReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UndoPointRequest, $0.UndoPointReply>(
        'UndoPoint',
        undoPoint_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UndoPointRequest.fromBuffer(value),
        ($0.UndoPointReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.ToggleHighlightRequest, $0.ToggleHighlightReply>(
        'ToggleHighlight',
        toggleHighlight_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.ToggleHighlightRequest.fromBuffer(value),
        ($0.ToggleHighlightReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetStateStreamRequest, $0.State>(
        'GetStateStream',
        getStateStream_Pre,
        false,
        true,
        ($core.List<$core.int> value) => $0.GetStateStreamRequest.fromBuffer(value),
        ($0.State value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetSummaryReply> getSummary_Pre($grpc.ServiceCall call, $async.Future<$0.GetSummaryRequest> request) async {
    return getSummary(call, await request);
  }

  $async.Future<$0.GetSummariesReply> getSummaries_Pre($grpc.ServiceCall call, $async.Future<$0.GetSummariesRequest> request) async {
    return getSummaries(call, await request);
  }

  $async.Future<$0.GetSummaryV2Reply> getSummaryV2_Pre($grpc.ServiceCall call, $async.Future<$0.GetSummaryRequest> request) async {
    return getSummaryV2(call, await request);
  }

  $async.Future<$0.GetSummariesV2Reply> getSummariesV2_Pre($grpc.ServiceCall call, $async.Future<$0.GetSummariesRequest> request) async {
    return getSummariesV2(call, await request);
  }

  $async.Future<$0.GetStateReply> getState_Pre($grpc.ServiceCall call, $async.Future<$0.GetStateRequest> request) async {
    return getState(call, await request);
  }

  $async.Future<$0.GetStateHistoryReply> getStateHistory_Pre($grpc.ServiceCall call, $async.Future<$0.GetStateHistoryRequest> request) async {
    return getStateHistory(call, await request);
  }

  $async.Future<$0.GetStateReply> getStateAtVersion_Pre($grpc.ServiceCall call, $async.Future<$0.GetStateAtVersionRequest> request) async {
    return getStateAtVersion(call, await request);
  }

  $async.Future<$0.ConfigureReply> configure_Pre($grpc.ServiceCall call, $async.Future<$0.ConfigureRequest> request) async {
    return configure(call, await request);
  }

  $async.Future<$0.AddPointReply> addPoint_Pre($grpc.ServiceCall call, $async.Future<$0.AddPointRequest> request) async {
    return addPoint(call, await request);
  }

  $async.Future<$0.UndoPointReply> undoPoint_Pre($grpc.ServiceCall call, $async.Future<$0.UndoPointRequest> request) async {
    return undoPoint(call, await request);
  }

  $async.Future<$0.ToggleHighlightReply> toggleHighlight_Pre($grpc.ServiceCall call, $async.Future<$0.ToggleHighlightRequest> request) async {
    return toggleHighlight(call, await request);
  }

  $async.Stream<$0.State> getStateStream_Pre($grpc.ServiceCall call, $async.Future<$0.GetStateStreamRequest> request) async* {
    yield* getStateStream(call, await request);
  }

  $async.Future<$0.GetSummaryReply> getSummary($grpc.ServiceCall call, $0.GetSummaryRequest request);
  $async.Future<$0.GetSummariesReply> getSummaries($grpc.ServiceCall call, $0.GetSummariesRequest request);
  $async.Future<$0.GetSummaryV2Reply> getSummaryV2($grpc.ServiceCall call, $0.GetSummaryRequest request);
  $async.Future<$0.GetSummariesV2Reply> getSummariesV2($grpc.ServiceCall call, $0.GetSummariesRequest request);
  $async.Future<$0.GetStateReply> getState($grpc.ServiceCall call, $0.GetStateRequest request);
  $async.Future<$0.GetStateHistoryReply> getStateHistory($grpc.ServiceCall call, $0.GetStateHistoryRequest request);
  $async.Future<$0.GetStateReply> getStateAtVersion($grpc.ServiceCall call, $0.GetStateAtVersionRequest request);
  $async.Future<$0.ConfigureReply> configure($grpc.ServiceCall call, $0.ConfigureRequest request);
  $async.Future<$0.AddPointReply> addPoint($grpc.ServiceCall call, $0.AddPointRequest request);
  $async.Future<$0.UndoPointReply> undoPoint($grpc.ServiceCall call, $0.UndoPointRequest request);
  $async.Future<$0.ToggleHighlightReply> toggleHighlight($grpc.ServiceCall call, $0.ToggleHighlightRequest request);
  $async.Stream<$0.State> getStateStream($grpc.ServiceCall call, $0.GetStateStreamRequest request);
}
