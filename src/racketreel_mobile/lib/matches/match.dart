import 'dart:ffi';

import 'package:racket_reel_mobile/matches/match_state.dart';
import 'package:racket_reel_mobile/matches/set_type.dart';

class Match {
  int id;
  DateTime createdDateTime;
  List<String> players;
  String servingFirst;
  int sets;
  SetType setType;
  SetType finalSetType;
  List<MatchState> states;

  Match(
    this.id,
    this.createdDateTime,
    this.players,
    this.servingFirst,
    this.sets,
    this.setType,
    this.finalSetType,
    this.states,
  );
}
