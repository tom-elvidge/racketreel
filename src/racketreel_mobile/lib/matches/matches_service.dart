import 'package:racket_reel_mobile/matches/create_match_command.dart';
import 'package:racket_reel_mobile/matches/match_state.dart';
import 'package:racket_reel_mobile/matches/create_match_state_command.dart';
import 'package:racket_reel_mobile/matches/match.dart';

abstract class MatchesService {
  Future<List<Match>> getMatches(
    int pageNumber,
  );

  Future<Match> getMatch(
    String matchId,
  );

  Future<Match> createMatch(
    CreateMatchCommand createMatchCommand,
  );

  Future<MatchState> getMatchState(
    String matchId,
    String stateIndex,
  );

  Future<MatchState> getLatestMatchState(
    String matchId,
  );

  Future<MatchState> createMatchState(
    CreateMatchStateCommand createMatchStateCommand,
  );

  Future<void> deleteLatestMatchState(
    String matchId,
  );
}
