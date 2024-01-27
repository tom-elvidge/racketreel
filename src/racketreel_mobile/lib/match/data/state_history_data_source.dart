import 'package:firebase_auth/firebase_auth.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:racketreel/app_config.dart';
import 'package:racketreel/auth/data/auth_interceptor.dart';
import 'package:racketreel/client/matches.pbgrpc.dart';
import 'package:racketreel/match/data/i_state_history_data_source.dart';

@Injectable(as: IStateHistoryDataSource)
class StateHistoryDataSource implements IStateHistoryDataSource
{
  late AppConfig _config;
  MatchesClient? _client;

  StateHistoryDataSource({
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
            credentials: ChannelCredentials.insecure(),
          ),
        ),
        interceptors: [
          AuthInterceptor(firebaseAuth: FirebaseAuth.instance)
        ]
    );
  }

  @override
  Future<List<State>> getStateHistory(int matchId) async {
    _client ??= _getClient();

    var request = new GetStateHistoryRequest();
    request.matchId = matchId;

    var reply = await _client!.getStateHistory(request);
    return reply.states;
  }
}