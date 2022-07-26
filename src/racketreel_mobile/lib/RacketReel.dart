import 'package:flutter/material.dart';
import 'package:racket_reel_mobile/ScoreMatch.dart';
import 'CreateMatchForm.dart';
import 'Scoring.dart';

class RacketReel extends StatefulWidget {
  @override
  RacketReelState createState() {
    return RacketReelState();
  }
}

class RacketReelState extends State<RacketReel> {
  String _matchId = "";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Racket Reel'),
        ),
        body: _matchId == ""
            ? CreateMatchForm(
                onSubmit: (data) {
                  var json = data.toJson();
                  debugPrint('data: $json');

                  // make request
                  // return error for form to display
                  // update matchid here
                  setState(() {
                    _matchId = "test";
                  });
                },
              )
            : Scoring(
                matchId: _matchId,
                onQuit: () {
                  setState(() {
                    _matchId = "";
                  });
                },
              ),
      ),
    );
  }
}
