import 'package:firebase_auth/firebase_auth.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:racketreel/app_config.dart';
import 'package:racketreel/auth/data/auth_interceptor.dart';
import 'package:racketreel/client/matches.pbgrpc.dart';

abstract interface class IMatchService
{
  Future<bool> deleteMatch(int matchId);
}

@Injectable(as: IMatchService)
class MatchService implements IMatchService
{
  late AppConfig _config;
  MatchesClient? _client;

  MatchService({
    required AppConfig config,
  }) {
    _config = config;
  }

  MatchesClient _getClient() {
    return MatchesClient(
        ClientChannel(
          _config.grpcHost,
          port: _config.grpcPort,
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
  Future<bool> deleteMatch(int matchId) async {
    _client ??= _getClient();

    var request = DeleteMatchRequest();
    request.matchId = matchId;

    var reply = await _client!.deleteMatch(request);
    return reply.success;
  }
}