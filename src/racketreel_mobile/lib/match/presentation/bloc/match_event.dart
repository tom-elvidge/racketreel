part of 'match_bloc.dart';

@immutable
abstract class MatchEvent {
  const MatchEvent();
}

final class FetchInitialEvent extends MatchEvent {
  final int matchId;
  const FetchInitialEvent(this.matchId);
}

final class FetchMatchStatesEvent extends MatchEvent {
  const FetchMatchStatesEvent();
}