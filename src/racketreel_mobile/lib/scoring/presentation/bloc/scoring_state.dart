part of 'scoring_bloc.dart';

@immutable
class ScoringState {
  final MatchStateEntity? matchState;
  final bool isComplete;
  final bool isUpdating;
  final bool isInitializing;
  final bool isLastStateHighlighted;
  final String? userErrorMessage;

  const ScoringState(
    this.matchState,
    this.isComplete,
    this.isUpdating,
    this.isInitializing,
    this.isLastStateHighlighted,
    this.userErrorMessage);
}

class ScoringInitial extends ScoringState {
  const ScoringInitial() : super(
    null,
    false,
    false,
    true,
    false,
    null);
}
