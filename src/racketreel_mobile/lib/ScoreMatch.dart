import 'package:flutter/material.dart';

class ScoreMatch extends StatefulWidget {
  const ScoreMatch({super.key});

  @override
  ScoreMatchState createState() {
    return ScoreMatchState();
  }
}

class ScoreMatchState extends State<ScoreMatch> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return const Text("Hello");
  }
}
