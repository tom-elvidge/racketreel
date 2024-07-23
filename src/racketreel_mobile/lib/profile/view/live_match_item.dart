import 'package:flutter/material.dart';
import 'package:racketreel/feed/domain/feed_item_v2_entity.dart';
import 'package:racketreel/feed/presentation/view/final_score_row.dart';
import 'package:racketreel/profile/live_matches_service.dart';
import 'package:racketreel/profile/user_service.dart';
import 'package:racketreel/shared/domain/name_helper.dart';

class LiveMatchItem extends StatelessWidget {
  const LiveMatchItem({super.key, required this.liveMatchEntity, required this.userDisplayName});

  final LiveMatchEntity liveMatchEntity;
  final String userDisplayName;

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
                child: Text(NameHelper.getInitials(userDisplayName)),
              ),
              Container(
                padding: const EdgeInsets.only(left: 5, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userDisplayName,
                      style: TextStyle(
                        color: Colors.blue.shade900,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      liveMatchEntity.datetime,
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
                    liveMatchEntity.format,
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 10,
                    ),
                  ),
                ],
              )
            ],
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          liveMatchEntity.teamOneName,
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    liveMatchEntity.teamOneSets,
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    liveMatchEntity.teamOneGames,
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 30,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    liveMatchEntity.teamOnePoints,
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
          IntrinsicHeight(
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Text(
                          liveMatchEntity.teamTwoName,
                          style: TextStyle(
                            color: Colors.blue.shade900,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    liveMatchEntity.teamTwoSets,
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 30,
                  height: 30,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    liveMatchEntity.teamTwoGames,
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 16,
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  width: 50,
                  height: 30,
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Text(
                    liveMatchEntity.teamTwoPoints,
                    style: TextStyle(
                      color: Colors.blue.shade900,
                      fontSize: 16,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}