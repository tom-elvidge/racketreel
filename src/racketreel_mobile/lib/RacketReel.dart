import 'package:flutter/material.dart';
import 'package:racket_reel_mobile/ScoreMatch.dart';
import 'package:racket_reel_mobile/matches/matches_service.dart';
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

  MatchesService _matchesService = getIt<MatchesService>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Racket Reel'),
        ),
        body: _matchId == ""
            ? CreateMatchForm(
                onSubmit: (data) async {
                  // make request
                  var match = await _matchesService.createMatch(data);

                  // todo: handle error with creating match

                  setState(() {
                    _matchId = match.id.toString();
                  });
                },
              )
            : Scoring(
                matchId: _matchId,
                onQuit: () {
                  // reset _matchId to show the CreateMatchForm again
                  setState(() {
                    _matchId = "";
                  });
                },
              ),
      ),
    );
  }
}
