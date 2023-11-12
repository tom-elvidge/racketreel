import 'package:flutter/material.dart';
import 'package:racketreel/scoring/presentation/view/scoreboard_row.dart';
import 'package:racketreel/shared/domain/team.dart';

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
        color: Colors.white,
        border: Border.all(
          color: Colors.blue.shade900, //color of border
          width: 2, //width of border
        ),
        borderRadius: BorderRadius.circular(5),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 1,
            blurRadius: 1,
            offset: const Offset(0, 2),
          )
        ],
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
