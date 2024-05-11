//
//  Generated code. Do not modify.
//  source: users.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use errorDescriptor instead')
const Error$json = {
  '1': 'Error',
  '2': [
    {'1': 'code', '3': 1, '4': 1, '5': 9, '10': 'code'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `Error`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List errorDescriptor = $convert.base64Decode(
    'CgVFcnJvchISCgRjb2RlGAEgASgJUgRjb2RlEhgKB21lc3NhZ2UYAiABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use createUserInfoRequestDescriptor instead')
const CreateUserInfoRequest$json = {
  '1': 'CreateUserInfoRequest',
};

/// Descriptor for `CreateUserInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserInfoRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVVc2VySW5mb1JlcXVlc3Q=');

@$core.Deprecated('Use createUserInfoReplyDescriptor instead')
const CreateUserInfoReply$json = {
  '1': 'CreateUserInfoReply',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.RacketReel.Error', '9': 0, '10': 'error', '17': true},
  ],
  '8': [
    {'1': '_error'},
  ],
};

/// Descriptor for `CreateUserInfoReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserInfoReplyDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVVc2VySW5mb1JlcGx5EhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSLAoFZXJyb3'
    'IYAiABKAsyES5SYWNrZXRSZWVsLkVycm9ySABSBWVycm9yiAEBQggKBl9lcnJvcg==');

@$core.Deprecated('Use getUserInfoRequestDescriptor instead')
const GetUserInfoRequest$json = {
  '1': 'GetUserInfoRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetUserInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserInfoRequestDescriptor = $convert.base64Decode(
    'ChJHZXRVc2VySW5mb1JlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklk');

@$core.Deprecated('Use getUserInfoReplyDescriptor instead')
const GetUserInfoReply$json = {
  '1': 'GetUserInfoReply',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.RacketReel.Error', '9': 0, '10': 'error', '17': true},
    {'1': 'user_info', '3': 3, '4': 1, '5': 11, '6': '.RacketReel.UserInfo', '9': 1, '10': 'userInfo', '17': true},
  ],
  '8': [
    {'1': '_error'},
    {'1': '_user_info'},
  ],
};

/// Descriptor for `GetUserInfoReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserInfoReplyDescriptor = $convert.base64Decode(
    'ChBHZXRVc2VySW5mb1JlcGx5EhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSLAoFZXJyb3IYAi'
    'ABKAsyES5SYWNrZXRSZWVsLkVycm9ySABSBWVycm9yiAEBEjYKCXVzZXJfaW5mbxgDIAEoCzIU'
    'LlJhY2tldFJlZWwuVXNlckluZm9IAVIIdXNlckluZm+IAQFCCAoGX2Vycm9yQgwKCl91c2VyX2'
    'luZm8=');

@$core.Deprecated('Use userInfoDescriptor instead')
const UserInfo$json = {
  '1': 'UserInfo',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'joined_at_utc', '3': 2, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'joinedAtUtc'},
    {'1': 'display_name', '3': 3, '4': 1, '5': 9, '10': 'displayName'},
    {'1': 'avatar_uri', '3': 4, '4': 1, '5': 9, '10': 'avatarUri'},
  ],
};

/// Descriptor for `UserInfo`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userInfoDescriptor = $convert.base64Decode(
    'CghVc2VySW5mbxIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSPgoNam9pbmVkX2F0X3V0YxgCIA'
    'EoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSC2pvaW5lZEF0VXRjEiEKDGRpc3BsYXlf'
    'bmFtZRgDIAEoCVILZGlzcGxheU5hbWUSHQoKYXZhdGFyX3VyaRgEIAEoCVIJYXZhdGFyVXJp');

@$core.Deprecated('Use updateUserInfoRequestDescriptor instead')
const UpdateUserInfoRequest$json = {
  '1': 'UpdateUserInfoRequest',
  '2': [
    {'1': 'display_name', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'displayName', '17': true},
    {'1': 'avatar_uri', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'avatarUri', '17': true},
  ],
  '8': [
    {'1': '_display_name'},
    {'1': '_avatar_uri'},
  ],
};

/// Descriptor for `UpdateUserInfoRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserInfoRequestDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVVc2VySW5mb1JlcXVlc3QSJgoMZGlzcGxheV9uYW1lGAEgASgJSABSC2Rpc3BsYX'
    'lOYW1liAEBEiIKCmF2YXRhcl91cmkYAiABKAlIAVIJYXZhdGFyVXJpiAEBQg8KDV9kaXNwbGF5'
    'X25hbWVCDQoLX2F2YXRhcl91cmk=');

@$core.Deprecated('Use updateUserInfoReplyDescriptor instead')
const UpdateUserInfoReply$json = {
  '1': 'UpdateUserInfoReply',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.RacketReel.Error', '9': 0, '10': 'error', '17': true},
  ],
  '8': [
    {'1': '_error'},
  ],
};

/// Descriptor for `UpdateUserInfoReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateUserInfoReplyDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVVc2VySW5mb1JlcGx5EhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSLAoFZXJyb3'
    'IYAiABKAsyES5SYWNrZXRSZWVsLkVycm9ySABSBWVycm9yiAEBQggKBl9lcnJvcg==');

@$core.Deprecated('Use followUserRequestDescriptor instead')
const FollowUserRequest$json = {
  '1': 'FollowUserRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `FollowUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List followUserRequestDescriptor = $convert.base64Decode(
    'ChFGb2xsb3dVc2VyUmVxdWVzdBIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQ=');

@$core.Deprecated('Use followUserReplyDescriptor instead')
const FollowUserReply$json = {
  '1': 'FollowUserReply',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.RacketReel.Error', '9': 0, '10': 'error', '17': true},
  ],
  '8': [
    {'1': '_error'},
  ],
};

/// Descriptor for `FollowUserReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List followUserReplyDescriptor = $convert.base64Decode(
    'Cg9Gb2xsb3dVc2VyUmVwbHkSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIsCgVlcnJvchgCIA'
    'EoCzIRLlJhY2tldFJlZWwuRXJyb3JIAFIFZXJyb3KIAQFCCAoGX2Vycm9y');

@$core.Deprecated('Use unfollowUserRequestDescriptor instead')
const UnfollowUserRequest$json = {
  '1': 'UnfollowUserRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `UnfollowUserRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unfollowUserRequestDescriptor = $convert.base64Decode(
    'ChNVbmZvbGxvd1VzZXJSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use unfollowUserReplyDescriptor instead')
const UnfollowUserReply$json = {
  '1': 'UnfollowUserReply',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.RacketReel.Error', '9': 0, '10': 'error', '17': true},
  ],
  '8': [
    {'1': '_error'},
  ],
};

/// Descriptor for `UnfollowUserReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List unfollowUserReplyDescriptor = $convert.base64Decode(
    'ChFVbmZvbGxvd1VzZXJSZXBseRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEiwKBWVycm9yGA'
    'IgASgLMhEuUmFja2V0UmVlbC5FcnJvckgAUgVlcnJvcogBAUIICgZfZXJyb3I=');

@$core.Deprecated('Use getFollowersRequestDescriptor instead')
const GetFollowersRequest$json = {
  '1': 'GetFollowersRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetFollowersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFollowersRequestDescriptor = $convert.base64Decode(
    'ChNHZXRGb2xsb3dlcnNSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use getFollowersReplyDescriptor instead')
const GetFollowersReply$json = {
  '1': 'GetFollowersReply',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.RacketReel.Error', '9': 0, '10': 'error', '17': true},
    {'1': 'follower_user_infos', '3': 3, '4': 3, '5': 11, '6': '.RacketReel.UserInfo', '10': 'followerUserInfos'},
  ],
  '8': [
    {'1': '_error'},
  ],
};

/// Descriptor for `GetFollowersReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFollowersReplyDescriptor = $convert.base64Decode(
    'ChFHZXRGb2xsb3dlcnNSZXBseRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEiwKBWVycm9yGA'
    'IgASgLMhEuUmFja2V0UmVlbC5FcnJvckgAUgVlcnJvcogBARJEChNmb2xsb3dlcl91c2VyX2lu'
    'Zm9zGAMgAygLMhQuUmFja2V0UmVlbC5Vc2VySW5mb1IRZm9sbG93ZXJVc2VySW5mb3NCCAoGX2'
    'Vycm9y');

@$core.Deprecated('Use getFollowingRequestDescriptor instead')
const GetFollowingRequest$json = {
  '1': 'GetFollowingRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
  ],
};

/// Descriptor for `GetFollowingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFollowingRequestDescriptor = $convert.base64Decode(
    'ChNHZXRGb2xsb3dpbmdSZXF1ZXN0EhcKB3VzZXJfaWQYASABKAlSBnVzZXJJZA==');

@$core.Deprecated('Use getFollowingReplyDescriptor instead')
const GetFollowingReply$json = {
  '1': 'GetFollowingReply',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.RacketReel.Error', '9': 0, '10': 'error', '17': true},
    {'1': 'following_user_infos', '3': 3, '4': 3, '5': 11, '6': '.RacketReel.UserInfo', '10': 'followingUserInfos'},
  ],
  '8': [
    {'1': '_error'},
  ],
};

/// Descriptor for `GetFollowingReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFollowingReplyDescriptor = $convert.base64Decode(
    'ChFHZXRGb2xsb3dpbmdSZXBseRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEiwKBWVycm9yGA'
    'IgASgLMhEuUmFja2V0UmVlbC5FcnJvckgAUgVlcnJvcogBARJGChRmb2xsb3dpbmdfdXNlcl9p'
    'bmZvcxgDIAMoCzIULlJhY2tldFJlZWwuVXNlckluZm9SEmZvbGxvd2luZ1VzZXJJbmZvc0IICg'
    'ZfZXJyb3I=');

@$core.Deprecated('Use isUserFollowerRequestDescriptor instead')
const IsUserFollowerRequest$json = {
  '1': 'IsUserFollowerRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'follower_user_id', '3': 2, '4': 1, '5': 9, '10': 'followerUserId'},
  ],
};

/// Descriptor for `IsUserFollowerRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isUserFollowerRequestDescriptor = $convert.base64Decode(
    'ChVJc1VzZXJGb2xsb3dlclJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEigKEGZvbG'
    'xvd2VyX3VzZXJfaWQYAiABKAlSDmZvbGxvd2VyVXNlcklk');

@$core.Deprecated('Use isUserFollowerReplyDescriptor instead')
const IsUserFollowerReply$json = {
  '1': 'IsUserFollowerReply',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error', '3': 2, '4': 1, '5': 11, '6': '.RacketReel.Error', '9': 0, '10': 'error', '17': true},
    {'1': 'isUserFollower', '3': 3, '4': 1, '5': 8, '10': 'isUserFollower'},
  ],
  '8': [
    {'1': '_error'},
  ],
};

/// Descriptor for `IsUserFollowerReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List isUserFollowerReplyDescriptor = $convert.base64Decode(
    'ChNJc1VzZXJGb2xsb3dlclJlcGx5EhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSLAoFZXJyb3'
    'IYAiABKAsyES5SYWNrZXRSZWVsLkVycm9ySABSBWVycm9yiAEBEiYKDmlzVXNlckZvbGxvd2Vy'
    'GAMgASgIUg5pc1VzZXJGb2xsb3dlckIICgZfZXJyb3I=');

