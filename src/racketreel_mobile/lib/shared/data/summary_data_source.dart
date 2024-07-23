import 'package:firebase_auth/firebase_auth.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:racketreel/app_config.dart';
import 'package:racketreel/auth/data/auth_interceptor.dart';
import 'package:racketreel/client/matches.pbgrpc.dart';
import 'package:racketreel/shared/data/i_summary_data_source.dart';

@Injectable(as: ISummaryDataSource)
class SummaryDataSource implements ISummaryDataSource
{
  late AppConfig _config;
  MatchesClient? _client;

  SummaryDataSource({
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
  Future<List<Summary>> getSummaries(int pageNumber) async {
    _client ??= _getClient();

    var request = GetSummariesRequest();
    request.pageNumber = pageNumber;
    request.pageSize = 10;

    var reply = await _client!.getSummaries(request);
    return reply.summaries;
  }

  @override
  Future<Summary> getSummary(int matchId) async {
    _client ??= _getClient();

    var request = GetSummaryRequest();
    request.matchId = matchId;

    var response = await _client!.getSummary(request);
    return response.summary;
  }

  @override
  Future<List<SummaryV2>> getSummariesV2(int pageNumber) async {
    _client ??= _getClient();

    var request = GetSummariesV2Request();
    request.pageNumber = pageNumber;
    request.pageSize = 10;
    request.allUsers = true;

    var reply = await _client!.getSummariesV2(request);
    return reply.summaries;
  }

  @override
  Future<SummaryV2> getSummaryV2(int matchId) async {
    _client ??= _getClient();

    var request = GetSummaryRequest();
    request.matchId = matchId;

    var response = await _client!.getSummaryV2(request);
    return response.summary;
  }
}