import 'package:flutter/material.dart';
import 'package:racketreel/scoring/presentation/view/scoreboard_row.dart';
import 'package:racketreel/shared/domain/team.dart';
import 'package:racketreel/shared/view/color_helper.dart';

class Scoreboard extends StatelessWidget {
  final String teamOneName;
  final String teamOneSets;
  final String teamOneGames;
  final String teamOnePoints;

  final String teamTwoName;
  final String teamTwoSets;
  final String teamTwoGames;
  final String teamTwoPoints;

  final Team servingTeam;

  const Scoreboard({
    Key? key,
    required this.teamOneName,
    required this.teamOneSets,
    required this.teamOneGames,
    required this.teamOnePoints,
    required this.teamTwoName,
    required this.teamTwoSets,
    required this.teamTwoGames,
    required this.teamTwoPoints,
    required this.servingTeam,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorHelper.lightenColor(Theme.of(context).colorScheme.surface, 0.035),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          ScoreboardRow(
            name: teamOneName,
            sets: teamOneSets,
            games: teamOneGames,
            points: teamOnePoints,
            serving: servingTeam == Team.teamOne,
          ),
          ScoreboardRow(
            name: teamTwoName,
            sets: teamTwoSets,
            games: teamTwoGames,
            points: teamTwoPoints,
            serving: servingTeam == Team.teamTwo,
          ),
        ],
      ),
    );
  }
}
