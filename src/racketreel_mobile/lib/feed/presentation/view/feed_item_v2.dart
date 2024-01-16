import 'package:flutter/material.dart';
import 'package:racketreel/feed/domain/feed_item_entity.dart';
import 'package:racketreel/feed/presentation/view/final_score_row.dart';

class FeedItemV2 extends StatelessWidget {
  const FeedItemV2({super.key, required this.feedItem});
  final FeedItemEntity feedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue.shade200,
        border: const Border(
          bottom: BorderSide(width: 1, color: Colors.white),
        ),
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FinalScoreRow(name: name, matchWon: matchWon, totalSetsWon: totalSetsWon, setScores: setScores),
          FinalScoreRow(name: name, matchWon: matchWon, totalSetsWon: totalSetsWon, setScores: setScores),
        ],
      ),
    );
  }
}
