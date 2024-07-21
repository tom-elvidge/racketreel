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
          borderRadius: const BorderRadius.all(Radius.circular(8))
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
                backgroundColor: Colors.blue.shade200,
                child: Text(getInitials(feedItem.user)),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      feedItem.user,
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
              const Spacer(),
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
              const Spacer(),
              Container(
                alignment: Alignment.center,
                width: 70,
                padding: const EdgeInsets.only(left: 20, right: 20),
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
              matchWon: feedItem.matchWonByTeamOne ?? false,
              totalSetsWon: feedItem.teamOneSets,
              setScores: feedItem.teamOneSetScores),
          FinalScoreRow(
              name: feedItem.teamTwoName,
              matchWon: !(feedItem.matchWonByTeamOne ?? true),
              totalSetsWon: feedItem.teamTwoSets,
              setScores: feedItem.teamTwoSetScores),
        ],
      ),
    );
  }

  String getInitials(String name) {
    // Split the name by spaces
    List<String> words = name.split(' ');

    // Filter out any empty strings (in case of multiple spaces)
    words = words.where((word) => word.isNotEmpty).toList();

    // Map each word to its first character, convert to uppercase, and join them
    String initials = words.map((word) => word[0].toUpperCase()).join('');

    return initials;
  }
}