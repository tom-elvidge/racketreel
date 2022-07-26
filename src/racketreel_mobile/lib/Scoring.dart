import 'package:flutter/material.dart';

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
          onPressed: widget.onQuit,
          child: const Text('Quit'),
        ),
      ],
    );
  }
}
