import 'package:flutter/material.dart';
import 'package:racketreel/feed/domain/feed_item_v2_entity.dart';
import 'package:racketreel/feed/presentation/view/final_score_row.dart';

class FeedItem extends StatelessWidget {
  const FeedItem({super.key, required this.feedItem});

  final FeedItemV2Entity feedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.shade50,
          border: Border.all(width: 1, color: Colors.blue.shade400),
          borderRadius: BorderRadius.all(Radius.circular(8))
      ),
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Card header
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                child: Text("US"),
                backgroundColor: Colors.blue.shade200,
              ),
              Container(
                padding: EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "User",
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      feedItem.datetime,
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    feedItem.format,
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 10,
                    ),
                  ),
                  Text(
                    feedItem.duration,
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 10,
                    ),
                  ),
                ],
              )
            ],
          ),
          // Scoreboard headers
          Row(
            children: [
              Spacer(),
              Container(
                alignment: Alignment.center,
                width: 70,
                padding: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  "SETS",
                  style: TextStyle(
                    color: Colors.blue.shade900,
                    fontSize: 8,
                  ),
                ),
              ),
              Row(
                children: feedItem.teamOneSetScores.map((e) =>
                    Container(
                      alignment: Alignment.center,
                      width: 30,
                      child: Text(
                        e.setNumber.toString(),
                        style: TextStyle(
                          color: Colors.blue.shade900,
                          fontSize: 8,
                        ),
                      ),
                    )).toList(),
              ),
            ],
          ),
          FinalScoreRow(
              name: feedItem.teamOneName,
              matchWon: feedItem.matchWonByTeamOne,
              totalSetsWon: feedItem.teamOneSets,
              setScores: feedItem.teamOneSetScores),
          FinalScoreRow(
              name: feedItem.teamTwoName,
              matchWon: !feedItem.matchWonByTeamOne,
              totalSetsWon: feedItem.teamTwoSets,
              setScores: feedItem.teamTwoSetScores),
        ],
      ),
    );
  }
}