import 'package:firebase_auth/firebase_auth.dart';
import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:racketreel/app_config.dart';
import 'package:racketreel/auth/data/auth_interceptor.dart';
import 'package:racketreel/client/matches.pbgrpc.dart';
import 'package:racketreel/scoring/data/i_scoring_service.dart';
import 'package:racketreel/shared/domain/match_state_entity.dart';
import 'package:racketreel/shared/domain/team.dart' as DomainTeam;

@Injectable(as: IScoringService)
class ScoringService implements IScoringService
{
  late AppConfig _config;
  MatchesClient? _client;

  ScoringService({
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
  Future<MatchStateEntity?> getState(int matchId) async {
    _client ??= _getClient();

    var request = GetStateRequest();
    request.matchId = matchId;

    var reply = await _client!.getState(request);

    if (!reply.success)
    {
      return null;
    }

    return _toEntity(reply.state);
  }

  @override
  Future<bool> toggleHighlight(int matchId, int version) async {
    _client ??= _getClient();

    var request = ToggleHighlightRequest();
    request.matchId = matchId;
    request.version = version;

    var reply = await _client!.toggleHighlight(request);

    return reply.success;
  }

  @override
  Future<bool> addPoint(int matchId, DomainTeam.Team team) async {
    _client ??= _getClient();

    var request = AddPointRequest();
    request.matchId = matchId;
    request.team = team == DomainTeam.Team.teamOne ? Team.TEAM_ONE : Team.TEAM_TWO;

    var reply = await _client!.addPoint(request);
    return reply.success;
  }

  @override
  Future<bool> undoPoint(int matchId) async {
    _client ??= _getClient();

    var request = UndoPointRequest();
    request.matchId = matchId;

    var reply = await _client!.undoPoint(request);
    return reply.success;
  }

  @override
  Future<MatchStateEntity?> getStateAtVersion(int matchId, int version) async {
    _client ??= _getClient();

    var request = GetStateAtVersionRequest();
    request.matchId = matchId;
    request.version = version;

    var reply = await _client!.getStateAtVersion(request);

    if (!reply.success)
    {
      return null;
    }

    return _toEntity(reply.state);
  }

  MatchStateEntity _toEntity(State state) {
    return MatchStateEntity(
      state.createdAtUtc.toString(),
      state.teamOneName,
      state.teamOneSets,
      state.teamOneGames,
      state.teamOnePoints,
      state.teamTwoName,
      state.teamTwoSets,
      state.teamTwoGames,
      state.teamTwoPoints,
      state.serving == Team.TEAM_ONE ? DomainTeam.Team.teamOne : DomainTeam.Team.teamTwo,
      state.highlighted,
      state.completed,
      state.version
    );
  }
}