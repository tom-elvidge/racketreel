import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:racketreel/app_config.dart';
import 'package:racketreel/client/matches.pbgrpc.dart';
import 'package:racketreel/match/data/i_state_history_data_source.dart';

@Injectable(as: IStateHistoryDataSource)
class StateHistoryDataSource implements IStateHistoryDataSource
{
  late AppConfig _config;
  ClientChannel? _channel;

  StateHistoryDataSource({
    required AppConfig config,
  }) {
    _config = config;
  }

  ClientChannel _getClientChannel()
  {
    return ClientChannel(
        _config.grpcHost,
        port: _config.grpcPort,
        options: const ChannelOptions(
            credentials: ChannelCredentials.insecure()));
  }

  @override
  Future<List<State>> getStateHistory(int matchId) async {
    _channel ??= _getClientChannel();

    var stub = MatchesClient(_channel!,
        options: CallOptions(timeout: const Duration(seconds: 30)));

    var request = new GetStateHistoryRequest();
    request.matchId = matchId;

    var reply = await stub.getStateHistory(request);
    return reply.states;
  }
}