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
                Text(
                  name,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 16,
                  ),
                ),
                if (matchWon)
                  Icon(
                    Icons.check,
                    color: Theme.of(context).colorScheme.primary,
                    size: 16.0,
                  ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.center,
            width: 70,
            height: 30,
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              totalSetsWon.toString(),
              style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 18,
              ),
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