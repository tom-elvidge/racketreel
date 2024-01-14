import 'package:racketreel/shared/domain/team.dart';

class MatchStateEntity
{
  final String datetime;
  final String teamOneName;
  final String teamOneSets;
  final String teamOneGames;
  final String teamOnePoints;
  final String teamTwoName;
  final String teamTwoSets;
  final String teamTwoGames;
  final String teamTwoPoints;
  final Team servingTeam;
  final bool highlighted;
  final bool completed;
  final int version;

  MatchStateEntity(
    this.datetime,
    this.teamOneName,
    this.teamOneSets,
    this.teamOneGames,
    this.teamOnePoints,
    this.teamTwoName,
    this.teamTwoSets,
    this.teamTwoGames,
    this.teamTwoPoints,
    this.servingTeam,
    this.highlighted,
    this.completed,
    this.version);
}