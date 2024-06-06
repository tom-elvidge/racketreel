import 'package:firebase_auth/firebase_auth.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:racketreel/app_config.dart';
import 'package:racketreel/auth/data/auth_interceptor.dart';
import 'package:racketreel/client/matches.pbgrpc.dart';
import 'package:racketreel/create_match/data/i_match_creator_service.dart';

@Injectable(as: IMatchCreatorService)
class MatchCreatorService implements IMatchCreatorService
{
  late AppConfig _config;
  MatchesClient? _client;

  MatchCreatorService({
    required AppConfig config,
  }) {
    _config = config;
  }

  MatchesClient _getClient()
  {
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
  Future<(bool, int)> create(String teamOneName, String teamTwoName, Team servingFirst, Format format) async {
    _client ??= _getClient();

    var request = new ConfigureRequest();
    request.teamOneName = teamOneName;
    request.teamTwoName = teamTwoName;
    request.servingFirst = servingFirst;
    request.format = format;

    var reply = await _client!.configure(request);

    return (reply.success, reply.matchId);
  }
}