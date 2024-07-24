import 'package:firebase_auth/firebase_auth.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:racketreel/app_config.dart';
import 'package:racketreel/auth/data/auth_interceptor.dart';
import 'package:racketreel/client/matches.pbgrpc.dart';
import 'package:racketreel/shared/data/repository_utils.dart';
import 'package:racketreel/shared/domain/format_helper.dart';
import 'package:racketreel/shared/domain/team.dart' as DomainTeam;

abstract interface class ILiveMatchesService {
  Future<List<LiveMatchEntity>> getLiveMatches(int pageNumber, String userId);
}

@Injectable(as: ILiveMatchesService)
class LiveMatchesService implements ILiveMatchesService {
  late AppConfig _config;
  MatchesClient? _client;

  LiveMatchesService({
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
  Future<List<LiveMatchEntity>> getLiveMatches(int pageNumber, String userId) async {
    _client ??= _getClient();

    var request = GetInProgressRequest();
    request.pageNumber = pageNumber;
    request.pageSize = 10;
    request.allUsers = false;
    request.userIds.add(userId);

    var reply = await _client!.getInProgress(request);

    return reply.matches
      .map((e) => LiveMatchEntity(
        e.matchId,
        e.creatorUserId,
        e.teamOneName,
        e.teamTwoName,
        e.teamOnePoints,
        e.teamTwoPoints,
        e.teamOneGames,
        e.teamTwoGames,
        e.teamOneSets,
        e.teamTwoSets,
        e.serving == Team.TEAM_ONE ? DomainTeam.Team.teamOne : DomainTeam.Team.teamTwo,
        FormatHelper.getFormatText(e.format),
        RepositoryUtils.getDateTimeString(e.startedAtUtc.toDateTime())
      ))
      .toList();
  }
}

class LiveMatchEntity {
  final int matchId;
  final String userId;
  final String teamOneName;
  final String teamTwoName;
  final String teamOnePoints;
  final String teamTwoPoints;
  final String teamOneGames;
  final String teamTwoGames;
  final String teamOneSets;
  final String teamTwoSets;
  final DomainTeam.Team servingTeam;
  final String format;
  final String datetime;

  LiveMatchEntity(
      this.matchId,
      this.userId,
      this.teamOneName,
      this.teamTwoName,
      this.teamOnePoints,
      this.teamTwoPoints,
      this.teamOneGames,
      this.teamTwoGames,
      this.teamOneSets,
      this.teamTwoSets,
      this.servingTeam,
      this.format,
      this.datetime);
}