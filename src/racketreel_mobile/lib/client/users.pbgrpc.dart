//
//  Generated code. Do not modify.
//  source: users.proto
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

import 'users.pb.dart' as $0;

export 'users.pb.dart';

@$pb.GrpcServiceName('RacketReel.UsersService')
class UsersServiceClient extends $grpc.Client {
  static final _$createUserInfo = $grpc.ClientMethod<$0.CreateUserInfoRequest, $0.CreateUserInfoReply>(
      '/RacketReel.UsersService/CreateUserInfo',
      ($0.CreateUserInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateUserInfoReply.fromBuffer(value));
  static final _$getUserInfo = $grpc.ClientMethod<$0.GetUserInfoRequest, $0.GetUserInfoReply>(
      '/RacketReel.UsersService/GetUserInfo',
      ($0.GetUserInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetUserInfoReply.fromBuffer(value));
  static final _$updateUserInfo = $grpc.ClientMethod<$0.UpdateUserInfoRequest, $0.UpdateUserInfoReply>(
      '/RacketReel.UsersService/UpdateUserInfo',
      ($0.UpdateUserInfoRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UpdateUserInfoReply.fromBuffer(value));
  static final _$followUser = $grpc.ClientMethod<$0.FollowUserRequest, $0.FollowUserReply>(
      '/RacketReel.UsersService/FollowUser',
      ($0.FollowUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.FollowUserReply.fromBuffer(value));
  static final _$unfollowUser = $grpc.ClientMethod<$0.UnfollowUserRequest, $0.UnfollowUserReply>(
      '/RacketReel.UsersService/UnfollowUser',
      ($0.UnfollowUserRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.UnfollowUserReply.fromBuffer(value));
  static final _$getFollowers = $grpc.ClientMethod<$0.GetFollowersRequest, $0.GetFollowersReply>(
      '/RacketReel.UsersService/GetFollowers',
      ($0.GetFollowersRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetFollowersReply.fromBuffer(value));
  static final _$getFollowing = $grpc.ClientMethod<$0.GetFollowingRequest, $0.GetFollowingReply>(
      '/RacketReel.UsersService/GetFollowing',
      ($0.GetFollowingRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetFollowingReply.fromBuffer(value));
  static final _$isUserFollower = $grpc.ClientMethod<$0.IsUserFollowerRequest, $0.IsUserFollowerReply>(
      '/RacketReel.UsersService/IsUserFollower',
      ($0.IsUserFollowerRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.IsUserFollowerReply.fromBuffer(value));

  UsersServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.CreateUserInfoReply> createUserInfo($0.CreateUserInfoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createUserInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetUserInfoReply> getUserInfo($0.GetUserInfoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getUserInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.UpdateUserInfoReply> updateUserInfo($0.UpdateUserInfoRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$updateUserInfo, request, options: options);
  }

  $grpc.ResponseFuture<$0.FollowUserReply> followUser($0.FollowUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$followUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.UnfollowUserReply> unfollowUser($0.UnfollowUserRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$unfollowUser, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetFollowersReply> getFollowers($0.GetFollowersRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFollowers, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetFollowingReply> getFollowing($0.GetFollowingRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getFollowing, request, options: options);
  }

  $grpc.ResponseFuture<$0.IsUserFollowerReply> isUserFollower($0.IsUserFollowerRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$isUserFollower, request, options: options);
  }
}

@$pb.GrpcServiceName('RacketReel.UsersService')
abstract class UsersServiceBase extends $grpc.Service {
  $core.String get $name => 'RacketReel.UsersService';

  UsersServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.CreateUserInfoRequest, $0.CreateUserInfoReply>(
        'CreateUserInfo',
        createUserInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateUserInfoRequest.fromBuffer(value),
        ($0.CreateUserInfoReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetUserInfoRequest, $0.GetUserInfoReply>(
        'GetUserInfo',
        getUserInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetUserInfoRequest.fromBuffer(value),
        ($0.GetUserInfoReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UpdateUserInfoRequest, $0.UpdateUserInfoReply>(
        'UpdateUserInfo',
        updateUserInfo_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UpdateUserInfoRequest.fromBuffer(value),
        ($0.UpdateUserInfoReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.FollowUserRequest, $0.FollowUserReply>(
        'FollowUser',
        followUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.FollowUserRequest.fromBuffer(value),
        ($0.FollowUserReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.UnfollowUserRequest, $0.UnfollowUserReply>(
        'UnfollowUser',
        unfollowUser_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.UnfollowUserRequest.fromBuffer(value),
        ($0.UnfollowUserReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetFollowersRequest, $0.GetFollowersReply>(
        'GetFollowers',
        getFollowers_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetFollowersRequest.fromBuffer(value),
        ($0.GetFollowersReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetFollowingRequest, $0.GetFollowingReply>(
        'GetFollowing',
        getFollowing_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetFollowingRequest.fromBuffer(value),
        ($0.GetFollowingReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.IsUserFollowerRequest, $0.IsUserFollowerReply>(
        'IsUserFollower',
        isUserFollower_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.IsUserFollowerRequest.fromBuffer(value),
        ($0.IsUserFollowerReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.CreateUserInfoReply> createUserInfo_Pre($grpc.ServiceCall call, $async.Future<$0.CreateUserInfoRequest> request) async {
    return createUserInfo(call, await request);
  }

  $async.Future<$0.GetUserInfoReply> getUserInfo_Pre($grpc.ServiceCall call, $async.Future<$0.GetUserInfoRequest> request) async {
    return getUserInfo(call, await request);
  }

  $async.Future<$0.UpdateUserInfoReply> updateUserInfo_Pre($grpc.ServiceCall call, $async.Future<$0.UpdateUserInfoRequest> request) async {
    return updateUserInfo(call, await request);
  }

  $async.Future<$0.FollowUserReply> followUser_Pre($grpc.ServiceCall call, $async.Future<$0.FollowUserRequest> request) async {
    return followUser(call, await request);
  }

  $async.Future<$0.UnfollowUserReply> unfollowUser_Pre($grpc.ServiceCall call, $async.Future<$0.UnfollowUserRequest> request) async {
    return unfollowUser(call, await request);
  }

  $async.Future<$0.GetFollowersReply> getFollowers_Pre($grpc.ServiceCall call, $async.Future<$0.GetFollowersRequest> request) async {
    return getFollowers(call, await request);
  }

  $async.Future<$0.GetFollowingReply> getFollowing_Pre($grpc.ServiceCall call, $async.Future<$0.GetFollowingRequest> request) async {
    return getFollowing(call, await request);
  }

  $async.Future<$0.IsUserFollowerReply> isUserFollower_Pre($grpc.ServiceCall call, $async.Future<$0.IsUserFollowerRequest> request) async {
    return isUserFollower(call, await request);
  }

  $async.Future<$0.CreateUserInfoReply> createUserInfo($grpc.ServiceCall call, $0.CreateUserInfoRequest request);
  $async.Future<$0.GetUserInfoReply> getUserInfo($grpc.ServiceCall call, $0.GetUserInfoRequest request);
  $async.Future<$0.UpdateUserInfoReply> updateUserInfo($grpc.ServiceCall call, $0.UpdateUserInfoRequest request);
  $async.Future<$0.FollowUserReply> followUser($grpc.ServiceCall call, $0.FollowUserRequest request);
  $async.Future<$0.UnfollowUserReply> unfollowUser($grpc.ServiceCall call, $0.UnfollowUserRequest request);
  $async.Future<$0.GetFollowersReply> getFollowers($grpc.ServiceCall call, $0.GetFollowersRequest request);
  $async.Future<$0.GetFollowingReply> getFollowing($grpc.ServiceCall call, $0.GetFollowingRequest request);
  $async.Future<$0.IsUserFollowerReply> isUserFollower($grpc.ServiceCall call, $0.IsUserFollowerRequest request);
}
