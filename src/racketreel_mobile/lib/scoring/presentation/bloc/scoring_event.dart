part of 'scoring_bloc.dart';

@immutable
sealed class ScoringEvent {
  const ScoringEvent();
}

final class InitialScoringEvent extends ScoringEvent {
  const InitialScoringEvent();
}


final class PointToTeamOneEvent extends ScoringEvent {
  const PointToTeamOneEvent();
}

final class PointToTeamTwoEvent extends ScoringEvent {
  const PointToTeamTwoEvent();
}

final class UndoEvent extends ScoringEvent {
  const UndoEvent();
}

final class ToggleHighlightEvent extends ScoringEvent {
  const ToggleHighlightEvent();
}