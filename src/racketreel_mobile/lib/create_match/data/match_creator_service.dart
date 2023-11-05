import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:racketreel/create_match/data/i_match_creator_service.dart';

import '../../app_config.dart';
import '../../client/matches.pbgrpc.dart';

@Injectable(as: IMatchCreatorService)
class MatchCreatorService implements IMatchCreatorService
{
  late AppConfig _config;
  ClientChannel? _channel;

  MatchCreatorService({
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
  Future<(bool, int)> create(String teamOneName, String teamTwoName, Team servingFirst, Format format) async {
    _channel ??= _getClientChannel();

    var stub = MatchesClient(_channel!,
        options: CallOptions(timeout: const Duration(seconds: 30)));

    var request = new ConfigureRequest();
    request.teamOneName = teamOneName;
    request.teamTwoName = teamTwoName;
    request.servingFirst = servingFirst;
    request.format = format;

    var reply = await stub.configure(request);
    return (reply.success, reply.matchId);
  }
}