import 'package:flutter/material.dart';
import 'package:racketreel/feed/domain/team_set_score.dart';

class TeamSetScoreContainer extends StatelessWidget {
  final TeamSetScore teamSetScore;

  const TeamSetScoreContainer({
    Key? key,
    required this.teamSetScore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 30,
      height: 30,
      child: Stack(
        children: [
          Text(
            teamSetScore.games.toString(),
            style: TextStyle(
              color: Colors.blue.shade900,
              fontWeight: teamSetScore.setWon
                  ? FontWeight.bold
                  : FontWeight.normal,
              fontSize: 18,
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Text(
              teamSetScore.tiebreakPoints.toString(),
              style: TextStyle(
                color: teamSetScore.tiebreakPoints == null
                    ? Colors.transparent
                    : Colors.blue.shade900,
                fontWeight: teamSetScore.setWon
                    ? FontWeight.bold
                    : FontWeight.normal,
                fontSize: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}