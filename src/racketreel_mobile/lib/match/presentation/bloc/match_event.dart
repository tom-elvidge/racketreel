part of 'match_bloc.dart';

@immutable
abstract class MatchEvent {
  const MatchEvent();
}

final class FetchInitialEvent extends MatchEvent {
  const FetchInitialEvent();
}

final class FetchMatchStatesEvent extends MatchEvent {
  const FetchMatchStatesEvent();
}