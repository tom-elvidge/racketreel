part of 'match_bloc.dart';

@immutable
abstract class MatchState extends Equatable {
  final bool fetchingSummary;
  final bool fetchingStates;
  final bool fetchedAllStates;
  final SummaryEntity summary;
  final List<MatchStateEntity> states;

  const MatchState(this.fetchingSummary, this.fetchingStates, this.fetchedAllStates, this.summary, this.states);

  @override
  List<Object> get props => [ fetchingSummary, fetchingStates, fetchedAllStates, summary, states ];

  @override
  String toString() => 'MatchState { fetchingSummary: $fetchingSummary, fetchingStates: $fetchingStates, fetchedAllStates: $fetchedAllStates, summary: $summary, states: $states }';
}

class FetchingSummary extends MatchState {
  FetchingSummary() : super(true, true, false, SummaryEntity.default_(), List<MatchStateEntity>.empty());
}

class FetchedSummary extends MatchState {
  FetchedSummary(fetchingStates, fetchedAllStates, summary, states) : super(false, fetchingStates, fetchedAllStates, summary, states);
}

class FetchingStates extends MatchState {
  FetchingStates(fetchingSummary, fetchedAllStates, summary, states) : super(fetchingSummary, true, fetchedAllStates, summary, states);
}

class FetchedStates extends MatchState {
  FetchedStates(fetchingSummary, fetchedAllStates, summary, states) : super(fetchingSummary, false, fetchedAllStates, summary, states);
}