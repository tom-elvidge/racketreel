part of 'scoring_bloc.dart';

@immutable
abstract class ScoringState {
  final int? matchId;
  final MatchStateEntity? matchState;
  final bool isUpdating;
  final bool isInitializing;
  final bool isLastStateHighlighted;
  final String? userErrorMessage;

  const ScoringState({
    this.matchId,
    this.matchState,
    this.isUpdating = false,
    this.isInitializing = false,
    this.isLastStateHighlighted = false,
    this.userErrorMessage,
  }) : super();

  ScoringState copyWith({
    int matchId,
    MatchStateEntity? matchState,
    bool isComplete,
    bool isUpdating,
    bool isInitializing,
    bool isLastStateHighlighted,
    String? userErrorMessage,
  });
}

class ScoringUpdate extends ScoringState {
  const ScoringUpdate({
    int? matchId,
    MatchStateEntity? matchState,
    bool isComplete = false,
    bool isUpdating = false,
    bool isInitializing = false,
    bool isLastStateHighlighted = false,
    String? userErrorMessage,
  }) : super(
    matchId: matchId,
    matchState: matchState,
    isUpdating: isUpdating,
    isInitializing: isInitializing,
    isLastStateHighlighted: isLastStateHighlighted,
    userErrorMessage: userErrorMessage,
  );

  @override
  ScoringUpdate copyWith({
    int? matchId,
    MatchStateEntity? matchState,
    bool? isComplete,
    bool? isUpdating,
    bool? isInitializing,
    bool? isLastStateHighlighted,
    String? userErrorMessage,
  }) {
    return ScoringUpdate(
      matchId: matchId ?? this.matchId,
      matchState: matchState ?? this.matchState,
      isUpdating: isUpdating ?? this.isUpdating,
      isLastStateHighlighted: isLastStateHighlighted ?? this.isLastStateHighlighted,
      userErrorMessage: userErrorMessage ?? this.userErrorMessage
    );
  }

  static ScoringUpdate initial()
  {
    return const ScoringUpdate(
      matchState: null,
      isComplete: false,
      isUpdating: false,
      isInitializing: true,
      isLastStateHighlighted: false,
      userErrorMessage: null,
    );
  }
}