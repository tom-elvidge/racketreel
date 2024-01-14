import 'package:injectable/injectable.dart';
import 'package:racketreel/client/matches.pb.dart';
import 'package:racketreel/match/data/i_state_history_data_source.dart';
import 'package:racketreel/match/domain/i_match_state_repository.dart';
import 'package:racketreel/shared/data/repository_utils.dart';
import 'package:racketreel/shared/domain/match_state_entity.dart';
import 'package:racketreel/shared/domain/team.dart' as domain_team;

@Injectable(as: IMatchStateRepository)
class MatchStateRepository implements IMatchStateRepository {
  late IStateHistoryDataSource _dataSource;

  MatchStateRepository({
    required IStateHistoryDataSource dataSource,
  }) {
    _dataSource = dataSource;
  }

  @override
  Future<List<MatchStateEntity>> getMatchStates(int matchId) async {
    var response = await _dataSource.getStateHistory(matchId);

    List<MatchStateEntity> states = List<MatchStateEntity>
        .generate(response.length, (index) => _createMatchStateEntity(response[index]));

    return states;
  }

  MatchStateEntity _createMatchStateEntity(State state) {
    return MatchStateEntity(
      RepositoryUtils.getDateTimeString((state.createdAtUtc.toDateTime())),
      state.teamOneName,
      state.teamOneSets,
      state.teamOneGames,
      state.teamOnePoints,
      state.teamTwoName,
      state.teamTwoSets,
      state.teamTwoGames,
      state.teamTwoPoints,
      state.serving == Team.TEAM_ONE ? domain_team.Team.teamOne : domain_team.Team.teamTwo,
      state.highlighted,
      state.completed,
      state.version
    );
  }
}