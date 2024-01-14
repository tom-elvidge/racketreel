import 'package:racketreel/shared/domain/match_state_entity.dart';
import 'package:racketreel/shared/domain/team.dart';

abstract interface class IScoringService
{
  Future<MatchStateEntity?> getState(int matchId);
  Future<MatchStateEntity?> getStateAtVersion(int matchId, int version);
  Future<bool> toggleHighlight(int matchId, int version);
  Future<bool> undoPoint(int matchId);
  Future<bool> addPoint(int matchId, Team team);
}