import 'package:flutter/material.dart';
import 'package:racketreel/feed/presentation/view/feed_page.dart';

class RacketReelApp extends StatelessWidget {
  const RacketReelApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: FeedPage(),
    );
  }
}
