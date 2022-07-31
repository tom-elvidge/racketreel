import 'player_score.dart';

class MatchState {
  DateTime createdDateTime;
  String serving;
  Map<String, PlayerScore> score;
  bool isTieBreak;

  MatchState(
    this.createdDateTime,
    this.serving,
    this.score,
    this.isTieBreak,
  );
}
