import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:racketreel/feed/presentation/bloc/feed_bloc.dart';
import 'package:racketreel/match/domain/i_match_state_repository.dart';
import 'package:racketreel/match/domain/i_summary_repository.dart';
import 'package:racketreel/match/domain/match_state_entity.dart';
import 'package:racketreel/match/domain/summary_entity.dart';
import 'package:racketreel/shared/data/i_summary_data_source.dart';

part 'match_event.dart';
part 'match_state.dart';

@injectable
class MatchBloc extends Bloc<MatchEvent, MatchState> {
  final IMatchStateRepository matchStareRepo;
  final ISummaryRepository summaryRepo;
  late final int matchId;

  MatchBloc(this.matchStareRepo, this.summaryRepo) : super(FetchingSummary()) {
    on<FetchInitialEvent>(_onInitialFetch);
    on<FetchMatchStatesEvent>(_onFetchMatchStatesEvent);
  }

  void _onInitialFetch(FetchInitialEvent event, Emitter<MatchState> emit) async {
    this.matchId = event.matchId;

    emit(FetchingSummary());
    var summary = await summaryRepo.getSummary(matchId);
    emit(FetchedSummary(state.fetchingStates, state.fetchedAllStates, summary, List<MatchStateEntity>.empty()));

    emit(FetchingStates(state.fetchingSummary, state.fetchedAllStates, state.summary, state.states));
    var states = await matchStareRepo.getMatchStates(matchId);
    emit(FetchedStates(state.fetchingSummary, true, state.summary, states));
  }

  void _onFetchMatchStatesEvent(FetchMatchStatesEvent event, Emitter<MatchState> emit) async {
    // todo: paginate get state history
  }
}
