part of 'match_bloc.dart';

@immutable
abstract class MatchState extends Equatable {
  final bool fetchingSummary;
  final bool fetchingStates;
  final bool fetchedAllStates;

  const MatchState(this.fetchingSummary, this.fetchingStates, this.fetchedAllStates);

  @override
  List<Object> get props => [ fetchingSummary, fetchingStates, fetchedAllStates ];

  @override
  String toString() => 'MatchState { fetchingSummary: $fetchingSummary, fetchingStates: $fetchingStates, fetchedAllStates: $fetchedAllStates }';

}

class FetchingSummary extends MatchState {
  FetchingSummary() : super(true, true, false);
}

class FetchedSummary extends MatchState {
  FetchedSummary(fetchingStates, fetchedAllStates) : super(false, fetchingStates, fetchedAllStates);
}

class FetchingStates extends MatchState {
  FetchingStates(fetchingSummary, fetchedAllStates) : super(fetchingSummary, true, fetchedAllStates);
}

class FetchedStates extends MatchState {
  FetchedStates(fetchingSummary, fetchedAllStates) : super(fetchingSummary, false, fetchedAllStates);
}