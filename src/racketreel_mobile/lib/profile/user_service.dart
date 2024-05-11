import 'package:firebase_auth/firebase_auth.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:racketreel/app_config.dart';
import 'package:racketreel/auth/data/auth_interceptor.dart';
import 'package:racketreel/client/users.pbgrpc.dart';

abstract interface class IUserService {
  Future<UserInfoEntity?> getUserInfo(String userId);
  Future<bool> updateUserInfo({String? displayName, Uri? avatar});
  Future<List<UserInfoEntity>?> getFollowers(String userId);
  Future<List<UserInfoEntity>?> getFollowing(String userId);
  Future<bool> followUser(String userId);
  Future<bool> unfollowUser(String userId);
  Future<bool> isUserFollower(String userId, String followerUserId);
}

@Injectable(as: IUserService)
class UserService implements IUserService {
  late AppConfig _config;
  UsersServiceClient? _client;

  UserService({
    required AppConfig config,
  }) {
    _config = config;
  }

  UsersServiceClient _getClient() {
    return UsersServiceClient(
        ClientChannel(
          _config.usersGrpcHost,
          port: _config.usersGrpcPort,
          options: const ChannelOptions(
            credentials: ChannelCredentials.secure(),
          ),
        ),
        interceptors: [
          AuthInterceptor(firebaseAuth: FirebaseAuth.instance)
        ]
    );
  }

  @override
  Future<UserInfoEntity?> getUserInfo(String userId) async {
    _client ??= _getClient();

    var request = GetUserInfoRequest(userId: userId);

    // todo: something not working here
    var reply = await _client!.getUserInfo(request);

    if (!reply.success)
    {
      return null;
    }

    return new UserInfoEntity(
        reply.userInfo.userId,
        reply.userInfo.displayName,
        Uri.https(reply.userInfo.avatarUri));
  }

  @override
  Future<bool> updateUserInfo({String? displayName, Uri? avatar}) async {
    _client ??= _getClient();

    var request = UpdateUserInfoRequest(
      displayName: displayName,
      avatarUri: avatar.toString(),
    );

    var reply = await _client!.updateUserInfo(request);

    return reply.success;
  }

  @override
  Future<List<UserInfoEntity>?> getFollowers(String userId) async {
    _client ??= _getClient();

    var request = GetFollowersRequest(userId: userId);

    var reply = await _client!.getFollowers(request);

    if (!reply.success) {
      return null;
    }

    return reply.followerUserInfos
      .map((e) => new UserInfoEntity(
        e.userId,
        e.displayName,
        Uri.https(e.avatarUri),
      ))
      .toList();
  }

  @override
  Future<List<UserInfoEntity>?> getFollowing(String userId) async {
    _client ??= _getClient();

    var request = GetFollowingRequest(userId: userId);

    var reply = await _client!.getFollowing(request);

    if (!reply.success) {
      return null;
    }

    return reply.followingUserInfos
      .map((e) => new UserInfoEntity(
        e.userId,
        e.displayName,
        Uri.https(e.avatarUri),
      ))
      .toList();
  }

  @override
  Future<bool> followUser(String userId) async {
    _client ??= _getClient();

    var request = FollowUserRequest(userId: userId);

    var reply = await _client!.followUser(request);

    return reply.success;
  }

  @override
  Future<bool> unfollowUser(String userId) async {
    _client ??= _getClient();

    var request = UnfollowUserRequest(userId: userId);

    var reply = await _client!.unfollowUser(request);

    return reply.success;
  }

  @override
  Future<bool> isUserFollower(String userId, String followerUserId) {
    // TODO: implement isUserFollower
    throw UnimplementedError();
  }
}

class UserInfoEntity {
  final String userId;
  final String displayName;
  final Uri avatar;

  UserInfoEntity(
    this.userId,
    this.displayName,
    this.avatar,
  );
}