import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  MatchBloc() : super(FetchingSummary()) {
    on<FetchInitialEvent>(_onInitialFetch);
    on<FetchMatchStatesEvent>(_onFetchMatchStatesEvent);
  }

  void _onInitialFetch(FetchInitialEvent event, Emitter<MatchState> emit) async {
    // todo: get match summary and emit FetchingSummary and FetchedSummary
  }

  void _onFetchMatchStatesEvent(FetchMatchStatesEvent event, Emitter<MatchState> emit) async {
    // todo: get next page of match states and emit FetchingStates and FetchedStates
  }
}
