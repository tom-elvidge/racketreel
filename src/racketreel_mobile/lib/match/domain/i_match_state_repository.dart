import 'package:racketreel/shared/domain/match_state_entity.dart';

abstract interface class IMatchStateRepository {
  Future<List<MatchStateEntity>> getMatchStates(int matchId);
}