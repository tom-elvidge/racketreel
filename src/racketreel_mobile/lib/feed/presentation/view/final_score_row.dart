import 'package:flutter/material.dart';
import 'package:racketreel/feed/domain/team_set_score.dart';
import 'package:racketreel/feed/presentation/view/team_set_score_widget.dart';

class FinalScoreRow extends StatelessWidget {
  final String name;
  final bool matchWon;
  final String totalSetsWon;
  final List<TeamSetScore> setScores;


  const FinalScoreRow({
    Key? key,
    required this.name,
    required this.matchWon,
    required this.totalSetsWon,
    required this.setScores,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    setScores.sort((a, b) => a.setNumber.compareTo(b.setNumber));

    return IntrinsicHeight(
      child: Row(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.only(left: 12, bottom: 7, top: 7),
                  child: Text(
                    name,
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                if (matchWon)
                  const Icon(
                    Icons.check,
                    color: Colors.green,
                    size: 16.0,
                  ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 30,
            height: 30,
            child: Stack(
              children: [
                Text(
                  totalSetsWon.toString(),
                  style: TextStyle(
                  color: Colors.blue.shade900,
                  fontWeight: matchWon ? FontWeight.bold : FontWeight.normal,
                  fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: setScores
                .map((e) => TeamSetScoreContainer(teamSetScore: e))
                .toList(),
          ),
        ],
      ),
    );
  }
}