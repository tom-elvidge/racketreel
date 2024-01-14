import 'package:grpc/grpc.dart';
import 'package:injectable/injectable.dart';
import 'package:racketreel/app_config.dart';
import 'package:racketreel/client/matches.pbgrpc.dart';
import 'package:racketreel/scoring/data/i_scoring_service.dart';
import 'package:racketreel/shared/domain/match_state_entity.dart';
import 'package:racketreel/shared/domain/team.dart' as DomainTeam;

@Injectable(as: IScoringService)
class ScoringService implements IScoringService
{
  late AppConfig _config;
  ClientChannel? _channel;

  ScoringService({
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
  Future<MatchStateEntity?> getState(int matchId) async {
    _channel ??= _getClientChannel();

    var stub = MatchesClient(_channel!,
        options: CallOptions(timeout: const Duration(seconds: 30)));

    var request = GetStateRequest();
    request.matchId = matchId;

    var reply = await stub.getState(request);

    if (!reply.success)
    {
      return null;
    }

    return _toEntity(reply.state);
  }

  @override
  Future<bool> toggleHighlight(int matchId, int version) async {
    _channel ??= _getClientChannel();

    var stub = MatchesClient(_channel!,
        options: CallOptions(timeout: const Duration(seconds: 30)));

    var request = ToggleHighlightRequest();
    request.matchId = matchId;
    request.version = version;

    var reply = await stub.toggleHighlight(request);

    return reply.success;
  }

  @override
  Future<bool> addPoint(int matchId, DomainTeam.Team team) async {
    _channel ??= _getClientChannel();

    var stub = MatchesClient(_channel!,
        options: CallOptions(timeout: const Duration(seconds: 30)));

    var request = AddPointRequest();
    request.matchId = matchId;
    request.team = team == DomainTeam.Team.teamOne ? Team.TEAM_ONE : Team.TEAM_TWO;

    var reply = await stub.addPoint(request);
    return reply.success;
  }

  @override
  Future<bool> undoPoint(int matchId) async {
    _channel ??= _getClientChannel();

    var stub = MatchesClient(_channel!,
        options: CallOptions(timeout: const Duration(seconds: 30)));

    var request = UndoPointRequest();
    request.matchId = matchId;

    var reply = await stub.undoPoint(request);
    return reply.success;
  }

  @override
  Future<MatchStateEntity?> getStateAtVersion(int matchId, int version) async {
    _channel ??= _getClientChannel();

    var stub = MatchesClient(_channel!,
        options: CallOptions(timeout: const Duration(seconds: 30)));

    var request = GetStateAtVersionRequest();
    request.matchId = matchId;
    request.version = version;

    var reply = await stub.getStateAtVersion(request);

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