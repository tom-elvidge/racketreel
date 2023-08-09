import 'package:flutter/material.dart';
import 'package:racketreel/feed/domain/feed_item_entity.dart';

class FeedItem extends StatelessWidget {
  const FeedItem({super.key, required this.feedItem});
  final FeedItemEntity feedItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
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
          Text(
            feedItem.title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 3,
          ),
          Text(
            feedItem.summary,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(feedItem.type),
          Text('Completed on ${feedItem.datetime}'),
        ],
      ),
    );
  }
}
