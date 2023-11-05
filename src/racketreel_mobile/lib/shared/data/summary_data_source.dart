import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:racketreel/app_config.dart';
import 'package:racketreel/client/matches.pbgrpc.dart';
import 'package:racketreel/shared/data/i_summary_data_source.dart';

@Injectable(as: ISummaryDataSource)
class SummaryDataSource implements ISummaryDataSource
{
  late AppConfig _config;
  ClientChannel? _channel;

  SummaryDataSource({
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
  Future<List<Summary>> getSummaries(int pageNumber) async {
    _channel ??= _getClientChannel();

    var stub = MatchesClient(_channel!,
        options: CallOptions(timeout: const Duration(seconds: 30)));

    var request = GetSummariesRequest();
    request.pageNumber = pageNumber;
    request.pageSize = 10;

    var reply = await stub.getSummaries(request);
    return reply.summaries;
  }

  @override
  Future<Summary> getSummary(int matchId) async {
    _channel ??= _getClientChannel();

    var stub = MatchesClient(_channel!,
        options: CallOptions(timeout: const Duration(seconds: 30)));

    var request = GetSummaryRequest();
    request.matchId = matchId;

    var response = await stub.getSummary(request);
    return response.summary;
  }
}