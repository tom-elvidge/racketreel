import 'package:racket_reel_mobile/matches/match_state.dart';
import 'package:racket_reel_mobile/matches/create_match_state_command.dart';
import 'package:racket_reel_mobile/matches/create_match_command.dart';
import 'package:racket_reel_mobile/matches/matches_service.dart';
import 'package:racket_reel_mobile/matches/match.dart';
import 'package:racket_reel_mobile/matches/player_score.dart';
import 'package:racket_reel_mobile/matches/set_type.dart';

class MatchesServiceDummy extends MatchesService {
  static final MatchState _dummyMatchState = MatchState(
    DateTime.now(),
    "Tom Elvidge",
    {
      "Tom Elvidge": PlayerScore(
        0,
        0,
        0,
      ),
      "Joe Bloggs": PlayerScore(
        0,
        0,
        0,
      ),
    },
    false,
  );

  static final Match _dummyMatch = Match(
    1,
    DateTime.now(),
    <String>["Tom Elvidge", "Joe Bloggs"],
    "Tom Elvidge",
    3,
    SetType.sixAllAdvantageRule,
    SetType.sixAllAdvantageRule,
    <MatchState>[_dummyMatchState],
  );

  @override
  Future<Match> createMatch(CreateMatchCommand createMatchCommand) async {
    return _dummyMatch;
  }

  @override
  Future<MatchState> createMatchState(
      CreateMatchStateCommand createMatchStateCommand) async {
    return _dummyMatchState;
  }

  @override
  Future<void> deleteLatestMatchState(String matchId) async {
    return;
  }

  @override
  Future<MatchState> getLatestMatchState(String matchId) async {
    return _dummyMatchState;
  }

  @override
  Future<Match> getMatch(String matchId) async {
    return _dummyMatch;
  }

  @override
  Future<MatchState> getMatchState(String matchId, String stateIndex) async {
    return _dummyMatchState;
  }

  @override
  Future<List<Match>> getMatches(int pageNumber) async {
    return <Match>[_dummyMatch];
  }
}
