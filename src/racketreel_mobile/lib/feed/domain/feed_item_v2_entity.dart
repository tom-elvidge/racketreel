import 'package:racketreel/feed/domain/team_set_score.dart';

class FeedItemV2Entity {
  int matchId;
  String format;
  String teamOneName;
  String teamTwoName;
  String teamOneSets;
  String teamTwoSets;
  bool matchWonByTeamOne;
  List<TeamSetScore> teamOneSetScores;
  List<TeamSetScore> teamTwoSetScores;
  String datetime;
  String duration;

  FeedItemV2Entity(
      this.matchId,
      this.format,
      this.teamOneName,
      this.teamTwoName,
      this.teamOneSets,
      this.teamTwoSets,
      this.matchWonByTeamOne,
      this.teamOneSetScores,
      this.teamTwoSetScores,
      this.datetime,
      this.duration);
}