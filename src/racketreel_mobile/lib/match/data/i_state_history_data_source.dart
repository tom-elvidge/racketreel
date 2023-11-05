import 'package:racketreel/client/matches.pb.dart';

abstract interface class IStateHistoryDataSource {
  Future<List<State>> getStateHistory(int matchId);
}