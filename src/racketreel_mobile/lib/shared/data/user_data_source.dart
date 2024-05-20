// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:grpc/grpc.dart';
// import 'package:injectable/injectable.dart';
// import 'package:racketreel/app_config.dart';
// import 'package:racketreel/auth/data/auth_interceptor.dart';
// import 'package:racketreel/client/users.pbgrpc.dart';
// import 'package:racketreel/shared/data/i_user_data_source.dart';
// import 'package:racketreel/shared/domain/user_entity.dart';
//
// @Injectable(as: IUserDataSource)
// class UserDataSource implements IUserDataSource {
//   late AppConfig _config;
//   UsersClient? _client;
//
//   UserDataSource({
//     required AppConfig config,
//   }) {
//     _config = config;
//   }
//
//   UsersClient _getClient() {
//     return UsersClient(
//         ClientChannel(
//           _config.grpcHost,
//           port: _config.grpcPort,
//           options: const ChannelOptions(
//             credentials: ChannelCredentials.secure(),
//           ),
//         ),
//         interceptors: [
//           AuthInterceptor(firebaseAuth: FirebaseAuth.instance)
//         ]
//     );
//   }
//
//   @override
//   Future<UserEntity> getUser(String userId) async {
//     _client ??= _getClient();
//
//     var request = new GetUserRequest(userId: userId);
//
//     var reply = await _client!.getUser(request);
//
//     return new UserEntity(reply.user.displayName);
//   }
// }