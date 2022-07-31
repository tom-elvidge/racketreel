import 'package:flutter/material.dart';
import 'package:racket_reel_mobile/service_locator.dart';
import 'package:racket_reel_mobile/matches/matches_service.dart';

class Scoring extends StatefulWidget {
  const Scoring({required this.onQuit, required this.matchId});

  final void Function() onQuit;
  final String matchId;
  @override
  ScoringState createState() {
    return ScoringState();
  }
}

class ScoringState extends State<Scoring> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(widget.matchId),
        ElevatedButton(
          onPressed: () async {},
          child: const Text('Point to Player One'),
        ),
        ElevatedButton(
          onPressed: () async {},
          child: const Text('Point to Player Two'),
        ),
        ElevatedButton(
          onPressed: () async {},
          child: const Text('Undo last point'),
        ),
        ElevatedButton(
          onPressed: widget.onQuit,
          child: const Text('Quit'),
        ),
      ],
    );
  }
}
